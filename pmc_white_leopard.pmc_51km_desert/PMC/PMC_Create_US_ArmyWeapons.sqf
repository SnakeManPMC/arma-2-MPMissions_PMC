
PMC_Create_US_ArmyWeapons =
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

	"US_Soldier_SL_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "LIEUTENANT"];
	"US_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"US_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "SERGEANT"];
	"US_Soldier_AMG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"US_Soldier_AMG_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
	"US_Soldier_LAT_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
