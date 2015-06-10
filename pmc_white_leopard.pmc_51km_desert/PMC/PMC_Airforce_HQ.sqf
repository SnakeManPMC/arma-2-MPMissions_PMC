/*

Syntax:
[respawnspot] execVM "PMC\PMC_Airforce_HQ.sqf";

Requires:
PMC\PMC_Create_Crew.sqf"
PMC\PMC_groupRecycle.sqf
PMC\PMC_killed.sqf

Returns:
-
*/

private ["_PMC_Aircraft_BLUFOR","_targetpoint","_respawnpoint","_vcl","_airforce","_tmp_vcl"];

_PMC_Aircraft_BLUFOR =
{
	private ["_grp","_helos","_myVec","_targetpoint","_tmp","_respawnpoint","_vcl","_wp","_ran"];

	_helos =
	[
		"A10_US_EP1",
		"MQ9PredatorB_US_EP1",
		"AV8B"
	];

	_targetpoint = _this select 0;
	_respawnpoint = _this select 1;

	// change this to floor and see if it works ok?
	_myVec = (_helos select floor random (count _helos));
//	_vcl = _myVec createVehicle (getPosASL pmc_blufor_start_1);
	_vcl = createVehicle [_myVec, _respawnpoint, [], 0, "FLY"];
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"US_Soldier_Pilot_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
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

	// flyingheight
	_vcl flyInHeight 300;

	_grp setbehaviour "COMBAT";
	_grp setcombatmode "RED";
	_grp setspeedmode "FULL";
	_grp setformation "WEDGE";
/*
	_grp addWaypoint [_targetpoint, 500];
	[_grp, 1] setWaypointBehaviour "COMBAT";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "SAD";
	[_grp, 1] setWaypointCompletionRadius 500;
*/
	// do the random patrolling waypoints
	_wp = 0;
	// this was 30 earlier, bit too much huh?
	while {_wp < 10} do
	{
		// choose random target.
		_ran = (floor random count PMC_loc);
		_targetpoint = (PMC_loc select _ran);
		// remove it from the temp array so it wont be chosen again.
		_wp = _wp + 1;

		// add waypoint to this target.
		_grp addWaypoint [_targetpoint, 500];
		[_grp, _wp] setWaypointBehaviour "COMBAT";
		[_grp, _wp] setWaypointCombatMode "RED";
		[_grp, _wp] setWaypointSpeed "FULL";
		[_grp, _wp] setWaypointFormation "COLUMN";
		[_grp, _wp] setWaypointType "SAD";
		// heh no timeout because createVehicle'd aircrafts return to starting location during this timeout! :)
		//[_grp, _wp] setWaypointTimeout [60*0.5, 60*2, 60*5]; // min 30sec, mid 2min, max 5min
	};

	// add one last for cycle, so if he survives, he does it all over again.
	_wp = _wp + 1;
	_grp addWaypoint [_respawnpoint, 0];
	[_grp, _wp] setWaypointType "CYCLE";

	// return the vehicle name
	_vcl
};

// set this to false to stop the script
PMC_aircraft_blufor_running = true;
publicVariable "PMC_aircraft_blufor_running";

// initialize him?
PMC_aircraft_blufor = 0;

// our airforce list of aircraft vehicles
_airforce = [];

// never ending loop to create units
while {PMC_aircraft_blufor_running} do
{
	// select target
	_targetpoint = PMC_loc select (random (count PMC_loc));
	// jiggle the fucker as it was array of cooridinates
	pmc_temp_logic setPos _targetpoint;

	// respawn point moves according to safe spot in our airbase...
	_respawnpoint = [_this select 0, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

	_vcl = [_targetpoint, _respawnpoint] call _PMC_Aircraft_BLUFOR;

	// add new aircraft into our airforce roster :)
	_airforce = _airforce + [_vcl];

	// lets put up a variable showing helo amounts created
	PMC_aircraft_blufor = PMC_aircraft_blufor + 1;
	publicVariable "PMC_aircraft_blufor";

	PMC_blufor = PMC_blufor + 1;
	publicVariable "PMC_blufor";

	PMC_grp_blufor = PMC_grp_blufor + 1;
	publicVariable "PMC_grp_blufor";

diag_log format["PMC_Airforce_HQ: _vcl: %1, PMC_blufor: %2, PMC_grp_blufor: %3", typeOf _vcl, PMC_blufor, PMC_grp_blufor];

	// do not attempt to create helos more than once a minute
	sleep 60;

	// ok our airforce roster is full, now lets start to keep track of them...
	if (count _airforce == 5) then
	{
		// wait until the helo cannot either; Move or Fire, or its simply dead.
		waitUntil
		{
			_tmp_vcl = (_airforce select 4);
			if (!alive _tmp_vcl || !canMove _tmp_vcl || !canFire _tmp_vcl) then
			{
				_airforce = _airforce - [_tmp_vcl];
			};

			_tmp_vcl = (_airforce select 3);
			if (!alive _tmp_vcl || !canMove _tmp_vcl || !canFire _tmp_vcl) then
			{
				_airforce = _airforce - [_tmp_vcl];
			};

			_tmp_vcl = (_airforce select 2);
			if (!alive _tmp_vcl || !canMove _tmp_vcl || !canFire _tmp_vcl) then
			{
				_airforce = _airforce - [_tmp_vcl];
			};

			_tmp_vcl = (_airforce select 1);
			if (!alive _tmp_vcl || !canMove _tmp_vcl || !canFire _tmp_vcl) then
			{
				_airforce = _airforce - [_tmp_vcl];
			};

			_tmp_vcl = (_airforce select 0);
			if (!alive _tmp_vcl || !canMove _tmp_vcl || !canFire _tmp_vcl) then
			{
				_airforce = _airforce - [_tmp_vcl];
			};

			// very relaxed script, lets give it 1min room to breathe
			sleep 60;
			// if we have dead aircraft, we continue from waituntil loop
			(count _airforce < 5);
		};
	};

	// wait until server FPS is over 20, in other words, if server is overwhelmed don't create aircrafts.
	waitUntil
	{
		sleep 5;
		(diag_fps > 20);
	};
};

// debug to show this script is running
PMC_aircraft_blufor_running = false;
publicVariable "PMC_aircraft_blufor_running";
diag_log format["PMC_Aircraft_BLUFOR.sqf EXITED! _vcl: %1, PMC_blufor: %2, PMC_grp_blufor: %3", typeOf _vcl, PMC_blufor, PMC_grp_blufor];
