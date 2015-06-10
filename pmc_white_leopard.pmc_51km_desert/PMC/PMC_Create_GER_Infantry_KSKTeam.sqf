
PMC_Create_GER_Infantry_KSKTeam =
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

	"GER_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.59, "SERGEANT"];
	"GER_Soldier_MG_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "CORPORAL"];
	"GER_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "CORPORAL"];
	"GER_Soldier_Scout_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"GER_Soldier_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "CORPORAL"];
	"GER_Soldier_Medic_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "PRIVATE"];

	_grp
};
