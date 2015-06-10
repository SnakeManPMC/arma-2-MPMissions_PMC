
PMC_Create_ACR_SpecialForcesTeam =
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

	"CZ_Special_Forces_TL_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"CZ_Special_Forces_MG_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"CZ_Special_Forces_GL_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"CZ_Special_Forces_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"CZ_Special_Forces_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"CZ_Special_Forces_Scout_DES_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
