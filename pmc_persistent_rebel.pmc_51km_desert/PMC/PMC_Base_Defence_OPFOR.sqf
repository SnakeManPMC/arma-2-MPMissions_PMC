
private ["_respawnpoint","_grp"];

// random starting location
_respawnpoint = ["OPFOR"] call PMC_SelectStartPosit;

// create basic US army squad
_grp = [_respawnpoint] call PMC_Create_Takistani_Army;
waitUntil {!(isNull _grp)};

PMC_opfor = PMC_opfor + 9;
publicVariable "PMC_opfor";
if (PMC_debug) then { diag_log format["BASE DEFENCE FOR OPFOR IS DONE: call PMC_Create_Takistani_Army! PMC_opfor: %1", PMC_opfor]; };

// put group into recycle script
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

// add one group created.
PMC_grp_opfor = PMC_grp_opfor + 1;
publicVariable "PMC_grp_opfor";

// patrolling waypoint for them
[_grp, _respawnpoint, 200] call PMC_Patrol_Inf_Waypoints;
if (PMC_debug) then { diag_log format["BASE DEFENCE IS SET OPFOR: call PMC_Patrol_Inf_Waypoints.sqf, _grp: %1", _grp]; };
