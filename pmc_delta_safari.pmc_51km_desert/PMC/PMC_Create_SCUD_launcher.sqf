/*
	PMC Create SCUD launcher
	
Syntax:
[position] execVM "PMC\PMC_Create_SCUD_launcher.sqf";

Example:
[_pos] execVM "PMC\PMC_Create_SCUD_launcher.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

private
[
	"_respawnpoint",
	"_offset",
	"_grp",
	"_vcl"
];

_respawnpoint = _this select 0;

// distance between vehicles
_offset = 75;

_grp = createGroup east;
waitUntil {!(isNull _grp)};

_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle _respawnpoint;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInDriver _vcl;

// first launcher.
_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-_offset,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
(units _grp select 1) moveInDriver _vcl;

// second launcher.
_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-(_offset*2),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
(units _grp select 2) moveInDriver _vcl;

// third launcher.
_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-(_offset*3),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
(units _grp select 3) moveInDriver _vcl;

// fourth launcher.
_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-(_offset*4),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
(units _grp select 4) moveInDriver _vcl;

// fifth launcher.
_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-(_offset*5),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
(units _grp select 5) moveInDriver _vcl;

// sixth launcher.
_vcl = "MAZ_543_SCUD_TK_EP1" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-(_offset*6),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
(units _grp select 6) moveInDriver _vcl;

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

_grp addWaypoint [_respawnpoint, 0];
[_grp, 1] setWaypointBehaviour "SAFE";
[_grp, 1] setWaypointCombatMode "YELLOW";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "COLUMN";
[_grp, 1] setWaypointType "SENTRY";

// add this group to the scud array
PMC_scuds = PMC_scuds + [_grp];
