
PMC_Create_Takistani_Militia_AA_Site =
{
	private
	[
		"_grp",
		"_respawnpoint",
		"_vcl",
		"_vcl2"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	_vcl = "DSHKM_TK_INS_EP1" createVehicle _respawnpoint;
	_vcl setDir random 360;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"TK_INS_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInGunner _vcl;

	_vcl2 = "ZU23_TK_INS_EP1" createVehicle [(_respawnpoint select 0)+20, (_respawnpoint select 1), 0];
	_vcl2 setDir random 360;
	_vcl2 addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"TK_INS_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	(units _grp select 1) moveInGunner _vcl2;

	"TK_INS_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_INS_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "PRIVATE"];
	"TK_INS_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	_grp
};
