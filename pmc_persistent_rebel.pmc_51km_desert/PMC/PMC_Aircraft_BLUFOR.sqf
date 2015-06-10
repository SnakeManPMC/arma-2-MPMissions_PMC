/*
	Random US aircraft patrol over the area.
	New one will be created when old is killed/out of ammo or sorts...

	if you want to externally shut down this script, do:
	PMC_aircraft_blufor_running = false;
	publicVariable "PMC_aircraft_blufor_running";

Syntax:
[startPos] execVM "PMC\PMC_Aircraft_BLUFOR.sqf";

Requires:
PMC\PMC_Create_Crew.sqf"
PMC\PMC_groupRecycle.sqf
PMC\PMC_killed.sqf

Returns:
-
*/

private
[
	"_PMC_Aircraft_BLUFOR",
	"_targetpoint",
	"_vcl",
	"_startPos"
];

_PMC_Aircraft_BLUFOR =
{
	private
	[
		"_grp",
		"_helos",
		"_myVec",
		"_targetpoint",
		"_tmp",
		"_vcl",
		"_startPos"
	];

	_helos =
	[
		"A10_US_EP1",
		"MQ9PredatorB_US_EP1"
	];

	_targetpoint = _this select 0;
	_startPos = _this select 1;

	// change this to floor and see if it works ok?
	_myVec = (_helos select floor random (count _helos));
//	_vcl = _myVec createVehicle (getPosASL pmc_blufor_start_1);
	_vcl = createVehicle [_myVec, _startPos, [], 0, "FLY"];
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"US_Soldier_Pilot_EP1" createUnit [_startPos, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	// create helo crew
	_tmp = [_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

	// wait until crew has been created, then proceed to add killed EH.
	waitUntil
	{
		scriptDone _tmp;
	};

	// recycle the group
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setbehaviour "COMBAT";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";

	_grp addWaypoint [_targetpoint, 500];
	[_grp, 1] setWaypointBehaviour "COMBAT";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
	[_grp, 1] setWaypointCompletionRadius 100;

	// return the vehicle name
	_vcl
};

// set this to false to stop the script
PMC_aircraft_blufor_running = true;
publicVariable "PMC_aircraft_blufor_running";

// initialize him?
PMC_aircraft_blufor = 0;

_startPos = _this select 0;

// never ending loop to create units
while {PMC_aircraft_blufor_running} do
{
	_targetpoint = call PMC_Select_Target;

	_vcl = [_targetpoint, _startPos] call _PMC_Aircraft_BLUFOR;

	// lets put up a variable showing helo amounts created
	PMC_aircraft_blufor = PMC_aircraft_blufor + 1;
	publicVariable "PMC_aircraft_blufor";

	PMC_blufor = PMC_blufor + 1;
	publicVariable "PMC_blufor";

	PMC_grp_blufor = PMC_grp_blufor + 1;
	publicVariable "PMC_grp_blufor";

diag_log format["PMC_Aircraft_BLUFOR: _vcl: %1, PMC_blufor: %2, PMC_grp_blufor: %3", typeOf _vcl, PMC_blufor, PMC_grp_blufor];

	// do not attempt to create helos more than once a minute
	sleep 60;

	// wait until the helo cannot either; Move or Fire, or its simply dead.
	waitUntil
	{
		// very relaxed script, lets give it 1min room to breathe
		sleep 60;
		// hes dead
		// he cant move
		// he cant fire (but what if he has no weapons like MH6?)
		// and fps is high enough
		((!alive _vcl || !canMove _vcl || !canFire _vcl) && (fps_diag > 15));
	};
};

// debug to show this script is running
PMC_aircraft_blufor_running = false;
publicVariable "PMC_aircraft_blufor_running";
diag_log format["PMC_Aircraft_BLUFOR.sqf EXITED! _vcl: %1, PMC_blufor: %2, PMC_grp_blufor: %3", typeOf _vcl, PMC_blufor, PMC_grp_blufor];
