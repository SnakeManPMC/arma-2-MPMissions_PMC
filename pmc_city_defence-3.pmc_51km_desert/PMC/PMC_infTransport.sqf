/*

this supposedly doesnt work becuse of the TR UNLOAD waypoint command...

*/

private ["_grp","_respawnpoint","_targetpoint","_side","_vcl","_HeloGrp"];

// name of the group to transport
_grp = _this select 0;
// where do the helo be created
_respawnpoint = _this select 1;
// where is the LZ
_targetpoint = _this select 2;
// blufor or opfor helo?
_side = _this select 3;

_vcl = objNull;
_HeloGrp = objNull;

if (_side == "West") then 
{
	_HeloGrp = createGroup (west);
	waitUntil
	{
		!(isNull _HeloGrp);
	};
	_vcl = "MH60S" createVehicle _respawnpoint;
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "SERGEANT"];
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
	(units _HeloGrp select 0) moveInDriver _vcl;
	(units _HeloGrp select 1) moveinTurret [_vcl,[0]];
	(units _HeloGrp select 2) moveinTurret [_vcl,[1]];
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _HeloGrp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
}
else
{
	_HeloGrp = createGroup (east);
	waitUntil
	{
		!(isNull _HeloGrp);
	};
	_vcl = "Mi17_rockets_RU" createVehicle _respawnpoint;
	"RU_Soldier_Pilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Pilot" createUnit [_respawnpoint, _HeloGrp, "", (random 1), "CORPORAL"];
	(units _HeloGrp select 0) moveInDriver _vcl;
	(units _HeloGrp select 1) moveinGunner _vcl;
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _HeloGrp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
};

// load our guys
{
	_x moveInCargo _vcl;
} forEach units _grp;

_HeloGrp setBehaviour "COMBAT";
_HeloGrp setCombatMode "RED";
_HeloGrp setFormation "WEDGE";
_HeloGrp setSpeedMode "FULL";

_vcl move _targetpoint;

waitUntil
{
	sleep 2;
	( ((_vcl distance _targetpoint) < 100) || !(canMove _vcl) );
};

{
	unassignVehicle _x;
} forEach units _grp;

// set the combat mood for him
_HeloGrp setBehaviour "COMBAT";
_HeloGrp setCombatMode "RED";
_HeloGrp setSpeedMode "FULL";
_HeloGrp setFormation "WEDGE";

// add one guard waypoint in random radius of 500m from the insert location.
_HeloGrp addWaypoint [_targetpoint, 500];
[_HeloGrp, 1] setWaypointBehaviour "COMBAT";
[_HeloGrp, 1] setWaypointCombatMode "RED";
[_HeloGrp, 1] setWaypointSpeed "FULL";
[_HeloGrp, 1] setWaypointFormation "WEDGE";
[_HeloGrp, 1] setWaypointType "GUARD";
