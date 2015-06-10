
PMC_Create_Takistani_Militia_Support =
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
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// car 1 - REAMMO
	_vcl = "V3S_Reammo_TK_GUE_EP1" createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	// car 2 - REFUEL
	_vcl2 = "V3S_Refuel_TK_GUE_EP1" createVehicle [(_respawnpoint select 0)+10, (_respawnpoint select 1), 0];
	_vcl2 addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	// car 3 - REPAIR
	_vcl3 = "V3S_Repair_TK_GUE_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 10];
	_vcl3 addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"TK_INS_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 1) moveInCargo _vcl;

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 2) moveInDriver _vcl2;

	"TK_GUE_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 3) moveInCargo _vcl2;

	"TK_INS_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 4) moveInDriver _vcl3;

	"TK_INS_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	(units _grp select 5) moveInCargo _vcl3;

	_grp
};
