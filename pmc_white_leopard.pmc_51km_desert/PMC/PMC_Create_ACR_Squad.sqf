
PMC_Create_ACR_Squad =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"CZ_Soldier_SL_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"CZ_Soldier_MG_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"CZ_Soldier_AT_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "CORPORAL"];
	"CZ_Soldier_AMG_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
