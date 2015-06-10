
PMC_Create_Takistani_Army_Special_Purpose =
{
	private
	[
		"_grp",
		"_respawnpoint"
	];

	_respawnpoint = _this select 0;

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"TK_Special_Forces_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"TK_Special_Forces_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_Special_Forces_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_Special_Forces_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_Special_Forces_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Special_Forces_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Special_Forces_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];

	_grp
};
