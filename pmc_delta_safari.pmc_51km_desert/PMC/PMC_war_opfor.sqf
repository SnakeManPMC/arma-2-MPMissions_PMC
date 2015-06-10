
private ["_a","_grp","_PMC_MaxUnits","_PMC_select_static_start_posit","_ran","_ran2","_respawnpoint","_PMC_temp_array"];

diag_log "PMC_war_opfor.sqf - Started...";

_PMC_temp_array = PMC_targets;

// unit creating
call compile preprocessFileLineNumbers "PMC\PMC_Create_Guerrilla_Takistan.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Guerrilla_Takistan_Weapons.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Insurgents_Technicals.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Militia.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Militia_AA_Site.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Militia_Statics.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Militia_Support.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Militia_Technicals.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_patrol_vehicle_opfor.sqf";

// waypoint setups
call compile preprocessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// lower the insurgent muslim SCUM skills
call compile preprocessFileLineNumbers "PMC\PMC_setAISkill.sqf";

// create marker function here too (its on vip/scud hunt scripts also as _ local).
//_createMarker = compile preprocessFileLineNumbers "PMC\PMC_Create_Marker.sqf";

// getting the max units from description.ext was so long code that it was nice to put on seprate sqf ;)
_PMC_MaxUnits = call compile preprocessFileLineNumbers "PMC\PMC_Get_Max_Units.sqf";

// chooses random location, removes it from selection.
_PMC_select_static_start_posit =
{
	private ["_ran","_respawnpoint","_tlogic","_PMC_temp_array"];
        _PMC_temp_array = _this select 0;

	// error check, not necessary I guess, but just in case
	if (count _PMC_temp_array == 0) exitWith { _tlogic = (PMC_targets select 0); _tlogic };

	_ran = (floor random (count _PMC_temp_array));
	_tlogic = (_PMC_temp_array select _ran);

	// remove the chosen guy from our temp array, so we dont choose same location twice.
	_PMC_temp_array = _PMC_temp_array - [_tlogic];

	_respawnpoint = [(getPosASL _tlogic), 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;

	// location, returned from this function
	_respawnpoint
};

_a = 0;
while { _a < _PMC_MaxUnits } do
{
	// random starting location
        _respawnpoint = [_PMC_temp_array] call _PMC_select_static_start_posit;
	_ran = floor (random 8);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan;
			_a = _a + 10;
		};

		case 1:
		{
			_grp = [_respawnpoint] call PMC_Create_Guerrilla_Takistan_Weapons;
			_a = _a + 6;
		};

		case 2:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia;
			_a = _a + 10;
		};

		case 3:
		{
			_grp = [_respawnpoint] call PMC_patrol_vehicle_opfor;
			_a = _a + 1;
		};

		case 4:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Insurgents_Technicals;
			_a = _a + 6;
		};

		case 5:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Technicals;
			_a = _a + 20;
		};

		case 6:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Statics;
			_a = _a + 1;
		};

		case 7:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_AA_Site;
			_a = _a + 5;
		};
	};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// run special low skills for them
	[_grp] call PMC_setAISkill;

	//[_respawnpoint] call _createMarker;
	_ran2 = floor (random 3);
	switch (_ran2) do
	{
		case 0:
		{
			//[_grp, _respawnpoint, 100] call PMC_Guard_Inf_Waypoints;
			[_grp, (getPosASL leader _grp), 1000] execVM "PMC\BIN_taskPatrol.sqf"
		};

		case 1:
		{
			//[_grp, _respawnpoint, 100] call PMC_Sentry_Inf_Waypoints;
			[_grp, (getPosASL leader _grp), 1000] execVM "PMC\BIN_taskPatrol.sqf"
		};

		case 2:
		{
			//[_grp, _respawnpoint, 500] call PMC_Patrol_Inf_Waypoints;
			[_grp, (getPosASL leader _grp), 1000] execVM "PMC\BIN_taskPatrol.sqf"
		};
	};

	if (PMC_debug) then
	{
		diag_log format["_grp: %1, _a: %2, _ran: %3, _ran2: %4", _grp, _a, _ran, _ran2];
	};
};

// refuel fob type places for enemys, unmanned, for now

// create the temp array again
_PMC_temp_array = [];
_PMC_temp_array = PMC_targets;

_a = 0;
while { _a < 15 } do
{
	// random starting location
	_respawnpoint = [_PMC_temp_array] call _PMC_select_static_start_posit;

	// create composition
	//[_respawnpoint, (random 360), "FuelDump1_TK_EP1"] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
	[_respawnpoint, (random 360), ["tk_local"]] call (compile (preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"));
/*
MediumTentCamp_GUE_EP1
SmallTentCamp_GUE_EP1
SmallTentCamp2_GUE_EP1

MediumTentCamp_TK_EP1
MediumTentCamp2_TK_EP1
MediumTentCamp3_TK_EP1
AntiAir1_TK_EP1
Firebase1_TK_EP1
FuelDump1_TK_EP1
RadarSite1_TK_EP1
VehicleParking1_TK_EP1
HeliParking1_TK_EP1
AirplaneParking1_TK_EP1
WeaponsStore1_TK_EP1
Camp1_TK_EP1
Camp2_TK_EP1
*/
	_a = _a + 1;

	if (PMC_debug) then
	{
		diag_log format["Object Compisition created to: %1, its number %2", _respawnpoint, _a];
	};
};

// create support vehicles
_a = 0;
while { _a < 7 } do
{
	// random starting location
	_respawnpoint = [_PMC_temp_array] call _PMC_select_static_start_posit;

	// create support vehicles
	_grp = [_respawnpoint] call PMC_Create_Takistani_Militia_Support;

	// low skills
	[_grp] call PMC_setAISkill;

	_grp setbehaviour "SAFE";
	_grp setcombatmode "GREEN";
	_grp setspeedmode "FULL";
	_grp setformation "COLUMN";

	// support waypoint so they will come to the aid of friendly vehicles low on ammo, fuel or damaged
	_grp addWaypoint [_respawnpoint, 0];
	[_grp, 1] setWaypointBehaviour "SAFE";
	[_grp, 1] setWaypointCombatMode "GREEN";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "COLUMN";
	[_grp, 1] setWaypointType "SUPPORT";

	_a = _a + 1;

	if (PMC_debug) then
	{
		diag_log format["Support vehicles created to: %1, its number %2", _respawnpoint, _a];
	};
};

//player sidechat "exited pmc_war_opfor.sqf";
diag_log "PMC_war_opfor.sqf - Finished!";

PMC_Hint = "PMC_war_opfor.sqf - Finished!";
publicVariable "PMC_Hint";
