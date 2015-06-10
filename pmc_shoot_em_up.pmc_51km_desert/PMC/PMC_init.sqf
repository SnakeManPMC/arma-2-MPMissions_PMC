/*

	Create location array from all class names entries (few in pmc 51km desert hehe)

*/

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

PMC_loc = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";
//diag_log format["PMC_loc: %1", PMC_loc];

// some of the scripts below call for bis functions
waitUntil { !isnil "bis_fnc_init" };

// players random starting location
PMC_starting_position = [] call compile preprocessFileLineNumbers "PMC\Starting_Location.sqf";
publicVariable "PMC_starting_position";
//diag_log format["PMC_starting_position: %1", PMC_starting_position];

// the actual sides (except west as our mission editor placed player is west guy).
[] execVM "PMC\Create_Sides.sqf";

// create trigger for each side
// pmc_all_units - anybody
[] execVM "PMC\Triggers_For_Sides.sqf";

// create gamelogic's for our stupid old script use ;)
[] execVM "PMC\Gamelogics_For_Old_Scripts.sqf";

// replace player randomly
[] execVM "PMC\Player_Identity_Crisis.sqf";

// corpse removal script
PMC_corpses = [];
PMC_killedNum = 0;
[100] execVM "PMC\PMC_corpses.sqf";

// number for created groups.
PMC_grp_blufor = 0;
PMC_grp_opfor = 0;
PMC_grpNum = 0;

// waypoint creation
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Vehicle_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// BLUFOR
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army_Sniper.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army_Support.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_ArmyWeapons.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_DeltaForce.sqf";

// OPFOR
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Sniper.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Special_Purpose.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Support.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Militia.sqf";

// create victory condition triggers
[PMC_starting_position] execVM "PMC\Victory_Condition.sqf";

// initial unit creation already in place all over the terrain (not just starting looper from the edges).
[PMC_starting_position] execVM "PMC\Initial_Unit_Creation.sqf";
