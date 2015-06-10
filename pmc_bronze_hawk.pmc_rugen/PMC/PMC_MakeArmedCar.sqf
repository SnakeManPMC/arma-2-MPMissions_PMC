/*

	Single armed car

*/

private ["_respawnpoint","_targetpoint","_waypointRanPosit","_myVec","_vcl","_grp","_wp"];

_respawnpoint = _this select 0;
_targetpoint = _this select 1;
_waypointRanPosit = _this select 2;

_myVec = (PMC_opfor_vehicle_car_armed select floor random (count PMC_opfor_vehicle_car_armed));
_vcl = _myVec createVehicle _respawnpoint;
_vcl setPos _respawnpoint;
_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
(units _grp select 0) moveInDriver _vcl;
(units _grp select 1) moveInGunner _vcl;

// increment the created units count
PMC_opfor = PMC_opfor + 2;
publicVariable "PMC_opfor";

// these to function somehow nicely, please :(
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

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
