
PMC_Create_Takistani_Army =
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

	"TK_Soldier_SL_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"TK_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"TK_Soldier_AT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_LAT_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"TK_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"TK_Soldier_AAT_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"TK_Soldier_AMG_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
