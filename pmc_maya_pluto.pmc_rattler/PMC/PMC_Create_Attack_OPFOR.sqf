/*

Syntax:
[starting location, target location] execVM "PMC\PMC_Create_Attack_NVA.sqf";

*/
private
[
	"_grp",
	"_respawnpoint",
	"_targetpoint",
	"_waypointRanPosit",
	"_wp"
];

_targetpoint = _this select 0;
_respawnpoint = _this select 1;
_waypointRanPosit = 50;

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"RU_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"RU_Soldier_LAT" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"RU_Soldier_MG" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"RU_Soldier_GL" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
"RU_Soldier_Marksman" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"RU_Soldier_MG" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"RU_Soldier_AR" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
"RU_Soldier_AT" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"RU_Soldier_LAT" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"RU_Soldier_GL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
"RU_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_x allowFleeing 0;
} forEach units _grp;

_grp setBehaviour "AWARE";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";
_grp setFormation "WEDGE";

_wp = 1;

_grp addWaypoint [_targetpoint, _waypointRanPosit];
[_grp, _wp] setWaypointBehaviour "AWARE";
[_grp, _wp] setWaypointCombatMode "RED";
[_grp, _wp] setWaypointSpeed "FULL";
[_grp, _wp] setWaypointFormation "WEDGE";
[_grp, _wp] setWaypointType "GUARD";
