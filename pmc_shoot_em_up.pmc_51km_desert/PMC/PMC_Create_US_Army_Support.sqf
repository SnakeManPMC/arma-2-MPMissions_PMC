
PMC_Create_US_Army_Support =
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

	"US_Soldier_TL_EP1" createUnit [_respawnpoint, _grp, "", 0.46, "LIEUTENANT"];
	"US_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "SERGEANT"];
	"US_Soldier_Marksman_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "SERGEANT"];
	"US_Soldier_Medic_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
