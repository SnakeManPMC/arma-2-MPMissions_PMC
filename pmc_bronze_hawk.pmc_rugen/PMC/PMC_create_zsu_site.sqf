
private ["_offset","_grp","_vcl","_respawnpoint"];

_respawnpoint = _this select 0;

_grp = createGroup east;
waitUntil {!(isNull _grp)};

private
[
	"_offset"
];

// how much off are the vehicles
_offset = 300;

_vcl = "ZSU_INS" createVehicle _respawnpoint;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInGunner _vcl;

_vcl = "ZSU_INS" createVehicle [(_respawnpoint select 0)+_offset,(_respawnpoint select 1),0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
(units _grp select 1) moveInGunner _vcl;

_vcl = "ZSU_INS" createVehicle [(_respawnpoint select 0)+_offset,(_respawnpoint select 1)+_offset,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
(units _grp select 2) moveInGunner _vcl;

_vcl = "ZSU_INS" createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)+_offset,0];
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
(units _grp select 3) moveInGunner _vcl;

{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _grp;

_grp setBehaviour "COMBAT";
_grp setCombatMode "RED";
