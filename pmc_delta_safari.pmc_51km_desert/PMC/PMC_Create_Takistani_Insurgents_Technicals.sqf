
PMC_Create_Takistani_Insurgents_Technicals =
{
	private
	[
		"_grp",
		"_vcl",
		"_vcl2",
		"_vcl3",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup resistance;
	waitUntil {!(isNull _grp)};

	"TK_GUE_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];

	// car 1
	_vcl = "Offroad_DSHKM_TK_GUE_EP1" createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	(units _grp select 0) moveInDriver _vcl;

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 1) moveInGunner _vcl;

	// car 2
	_vcl2 = "Offroad_SPG9_TK_GUE_EP1" createVehicle [(_respawnpoint select 0)+10, (_respawnpoint select 1), 0];
	_vcl2 addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 2) moveInDriver _vcl2;
	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 3) moveInGunner _vcl2;

	// car 3
	_vcl3 = "Pickup_PK_TK_GUE_EP1" createVehicle [(_respawnpoint select 0), (_respawnpoint select 1)+10, 0];
	_vcl3 addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 4) moveInDriver _vcl3;

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 5) moveInGunner _vcl3;

	"TK_GUE_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 6) assignAsCargo _vcl2;

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 7) assignAsCargo _vcl3;

	_grp
};
