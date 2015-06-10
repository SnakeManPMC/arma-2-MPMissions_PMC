
private ["_respawnpoint","_grp"];

// random starting location
_respawnpoint = ["BLUFOR"] call PMC_SelectStartPosit;

// create basic US army squad
_grp = [_respawnpoint] call PMC_Create_US_Army;
waitUntil {!(isNull _grp)};

PMC_blufor = PMC_blufor + 9;
publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BASE DEFENCE FOR BLUFOR IS DONE: call PMC_Create_US_Army! PMC_blufor: %1", PMC_blufor]; };

// put group into recycle script
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

// add one group created.
PMC_grp_blufor = PMC_grp_blufor + 1;
publicVariable "PMC_grp_blufor";

// patrolling waypoint for them
[_grp, _respawnpoint, 200] call PMC_Patrol_Inf_Waypoints;
if (PMC_debug) then { diag_log format["BASE DEFENCE IS SET BLUFOR: call PMC_Patrol_Inf_Waypoints.sqf, _grp: %1", _grp]; };
