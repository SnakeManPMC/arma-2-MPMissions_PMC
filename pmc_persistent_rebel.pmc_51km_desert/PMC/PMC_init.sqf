/*

	PMC Persistent Rebel main initialization

*/

private ["_tmp","_respawnpoint"];

// both objectives
PMC_objective1_done = false;
publicVariable "PMC_objective1_done";

PMC_objective2_done = false;
publicVariable "PMC_objective2_done";
// mission ending trigger condition
PMC_mcomplete = false;
publicVariable "PMC_mcomplete";

// debug on
PMC_debug = true;
publicVariable "PMC_debug";

// number of created groups
PMC_grpNum = 0;
publicVariable "PMC_grpNum";

// respawn counter
PMC_PlayerRespawns = 0;
publicVariable "PMC_PlayerRespawns";

// mission end variable
PMC_mcomplete = false;
publicVariable "PMC_mcomplete";

// how many groups?
PMC_grp_blufor = 0;
PMC_grp_opfor = 0;
publicVariable "PMC_grp_blufor";
publicVariable "PMC_grp_opfor";

// initialized variables and settings
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

// create all sides (except guerrilla as we are GORILLA!);
[] execVM "PMC\PMC_Create_Sides.sqf";

// corpse removal script
PMC_corpses = [];
[75] execVM "PMC\PMC_corpses.sqf";
// no need to PV this anymore, would be for stupid debug reasons only.
//publicVariable "PMC_corpses";

// count for opfor
PMC_opfor = 0;
publicVariable "PMC_opfor";

// count for blufor
PMC_blufor = 0;
publicVariable "PMC_blufor";

PMC_InfTransport = 0;
publicVariable "PMC_InfTransport";
PMC_InfTransportUsed = 0;
publicVariable "PMC_InfTransportUsed";

// create ammo boxes for guerrillas
// DISABLED as we really don't want any weapons for the guerrillas at start. 9/Jul/2014 8:59
//[] execVM "PMC\PMC_Ammo_Boxes.sqf";

// load some routines

// PMC_SelectStartPosit starting position selecting function
call compile preProcessFileLineNumbers "PMC\PMC_SelectStartPosit.sqf";

// PMC_Select_Target
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";

// PMC_Patrol_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";

// PMC_Guard_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";

// PMC_Patrol_Inf_Targets_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Targets_Waypoints.sqf";

// PMC_Sentry_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// collect targets from pmc_? gamelogics
_tmp = [] execVM "PMC\PMC_targets.sqf";
// lets make sure our target array is fully done.
waitUntil
{
	scriptDone _tmp;
};

// triggers for server too
[] execVM "PMC\Triggers.sqf";

// this is silly...
pmc_var1 = "not used";
publicVariable "pmc_var1";

waitUntil { !isnil "bis_fnc_init" };

// OPFOR war
[] execVM "PMC\PMC_war_opfor.sqf";

// BLUFOR war
[] execVM "PMC\PMC_war_blufor.sqf";

// run random helo patrol :)
[] execVM "PMC\PMC_HeloBLUFOR.sqf";
[] execVM "PMC\PMC_HeloOPFOR.sqf";

// run random aircraft
[(getPosASL pmc_blufor_start_1)] execVM "PMC\PMC_Aircraft_BLUFOR.sqf";
[(getPosASL pmc_opfor_start_1)] execVM "PMC\PMC_Aircraft_OPFOR.sqf";

// new experimental convoy
_respawnpoint = ["BLUFOR"] call PMC_SelectStartPosit;
[_respawnpoint] execVM "PMC\PMC_Create_Convoy_BLUFOR.sqf";

sleep 30;
// small truck + security vehicle setup, loaded with goodies
[[(_respawnpoint select 0)+50, (_respawnpoint select 1)+50, 0]] execVM "PMC\PMC_Trucks_Juicy_Load.sqf";
