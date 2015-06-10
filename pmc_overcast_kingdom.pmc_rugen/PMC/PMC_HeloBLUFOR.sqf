/*
	Random US helicopter patrol over the area.
	New one will be created when old is killed/out of ammo or sorts...

Requires:
	PMC\PMC_Create_Crew.sqf"
*/

private
[
	"_PMC_MakeHeloBLUFOR",
	"_targetpoint",
	"_vcl"
];

_PMC_MakeHeloBLUFOR =
{
	private
	[
		"_grp",
		"_helos",
		"_myVec",
		"_targetpoint",
		"_tmp",
		"_vcl"
	];

/* OA
	_helos =
	[
		"AH64D_EP1",
		"AH6J_EP1",
		"CH_47F_EP1",
		"MH6J_EP1",
		"UH1H_TK_GUE_EP1",
		"UH60M_EP1"
	];
*/
	_helos =
	[
		"AH1Z",
		"AH64D",
		"MH60S",
		"UH1Y"
	];

	_targetpoint = _this select 0;

	// change this to floor and see if it works ok?
	_myVec = (_helos select floor random (count _helos));
	_vcl = _myVec createVehicle (getPosASL pmc_blufor_start_1);
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

// pilots OA: US_Soldier_Pilot_EP1
// pilots A2: USMC_Soldier_Pilot
	"USMC_Soldier_Pilot" createUnit [(getPosASL pmc_blufor_start_1), _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	// create helo crew
	_tmp = [_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

	// wait until crew has been created, then proceed to add killed EH.
	waitUntil
	{
		scriptDone _tmp;
	};

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

	// return the vehicle name
	_vcl
};

// initialize him?
PMC_helo_blufor = 0;

// never ending loop to create units
while {true} do
{
	//_ran = (floor random (count PMC_targets));
	//_targetpoint = getPosASL (PMC_targets select _ran);
	_targetpoint = call PMC_Select_Target;

	_vcl = [_targetpoint] call _PMC_MakeHeloBLUFOR;

	// lets put up a variable showing helo amounts created
	PMC_helo_blufor = PMC_helo_blufor + 1;
	publicVariable "PMC_helo_blufor";

	PMC_blufor = PMC_blufor + 1;
	publicVariable "PMC_blufor";

	PMC_grp_blufor = PMC_grp_blufor + 1;
	publicVariable "PMC_grp_blufor";

diag_log format["PMC_HeloBLUFOR: _vcl: %1, PMC_blufor: %1, PMC_grp_blufor: %3", _vcl, PMC_blufor, PMC_grp_blufor];

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
		(!alive _vcl || !canMove _vcl || !canFire _vcl);
	};
};

diag_log format["PMC_HeloBLUFOR.sqf EXITED! _vcl: %1, PMC_blufor: %1, PMC_grp_blufor: %3", _vcl, PMC_blufor, PMC_grp_blufor];
