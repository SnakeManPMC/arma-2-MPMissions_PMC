
private ["_tmp","_respawnpoint","_targetpoint","_waypointRanPosit","_myVec","_vcl","_grp","_wp"];

_tmp =
[
	"Mi17_rockets_RU",
	"Mi17_rockets_RU"
];

_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;

_myVec = (_tmp select floor random (count _tmp));
_vcl = _myVec createVehicle _respawnpoint;
_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"RU_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInDriver _vcl;

[_vcl, _grp] execVM "PMC\PMC_create_crew.sqf";

// increment the created units count
PMC_opfor = PMC_opfor + 1;
publicVariable "PMC_opfor";

// these to function somehow nicely, please :(
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

_grp setBehaviour "COMBAT";
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
