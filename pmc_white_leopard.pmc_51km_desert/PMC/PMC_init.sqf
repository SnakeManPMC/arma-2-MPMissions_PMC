
// if not server, just exit...

private ["_tmp"];

// setup mobile respawn initial spot
PMC_mobile_respawn_spot = getMarkerPos "respawn_guerrilla";
publicVariable "PMC_mobile_respawn_spot";

// Create location array from all class names entries (few in pmc 51km desert hehe)
PMC_loc = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";

// players random starting location
//[] execVM "PMC\Starting_Location.sqf";

// the actual sides (except west as our mission editor placed player is west guy).
[] execVM "PMC\Create_Sides.sqf";

// create trigger for each side
// pmc_all_units - anybody
[] execVM "PMC\Triggers_For_Sides.sqf";

// create gamelogic's for our stupid old script use ;)
[] execVM "PMC\Gamelogics_For_Old_Scripts.sqf";

// replace player randomly
//[] execVM "PMC\Player_Identity_Crisis.sqf";

PMC_debug = true;
publicVariable "PMC_debug";
// corpse removal script
PMC_corpses = [];
PMC_killedNum = 0;
[100] execVM "PMC\PMC_corpses.sqf";

// number for created groups.
PMC_grp_blufor = 0;
PMC_grp_opfor = 0;
PMC_grpNum = 0;

// for infantry transport
PMC_InfTransport = 0;

// player respawns
PMC_PlayerRespawns = 0;
publicVariable "PMC_PlayerRespawns";

// weather disabled, its raining like all the time, what the fuck?
//[] execVM "PMC\PMC_weather.sqf";

// waypoint creation
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Vehicle_Waypoints.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// BLUFOR
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army_Sniper.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army_Support.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_ArmyWeapons.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_DeltaForce.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_ACR_Squad.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_ACR_SpecialForcesTeam.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_Create_GER_Infantry_KSKTeam.sqf";

// OPFOR
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Sniper.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Support.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Militia.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Special_Purpose.sqf";

// counting groups per side
PMC_countGroups = compile preProcessFileLineNumbers "PMC\PMC_countGroups.sqf";

waitUntil { !isnil "bis_fnc_init" };

// initial unit creation already in place all over the terrain (not just starting looper from the edges).
_tmp = [] execVM "PMC\Initial_Unit_Creation.sqf";
waitUntil { scriptDone _tmp; };

// debug
diag_log format["Initial_Unit_Creation done at %1", time];

// small wait...
sleep 1;

// log shit to RPT file ;)
[] execVM "PMC\PMC_Server_RPT_Logger.sqf";

// war unit creation system
[] execVM "PMC\War_BLUFOR.sqf";
// so that our stupid scripts wont conflict ;)
sleep 2;
// opfor start hardcoded [9944, 49088, 0];
[] execVM "PMC\War_OPFOR.sqf";

// blufor vehicles only
[20, 20] execVM "PMC\War_Vehicles_BLUFOR.sqf";

// opfor vehicles only
[80, 20] execVM "PMC\War_Vehicles_OPFOR.sqf";

// aircrafts
[] execVM "PMC\PMC_Aircraft_BLUFOR_MODIFIED.sqf";
[] execVM "PMC\PMC_Aircraft_OPFOR_MODIFIED.sqf";

// helicopters
[] execVM "PMC\PMC_HeloBLUFOR_MODIFIED.sqf";
[] execVM "PMC\PMC_HeloOPFOR_MODIFIED.sqf";

// BLUFOR convoy
[[1854, 2448, 0]] execVM "PMC\PMC_Create_Convoy_BLUFOR.sqf";
sleep 1;
// OPFOR convoy
[[9944, 49088, 0]] execVM "PMC\PMC_Create_Convoy_OPFOR.sqf";

// new experimental airforce HQ thing :)
[[1854, 2448, 0]] execVM "PMC\PMC_Airforce_HQ.sqf";
