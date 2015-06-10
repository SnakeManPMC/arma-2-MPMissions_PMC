
PMC_Create_Takistani_Army_Support =
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

	"TK_Soldier_Medic_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "LIEUTENANT"];
	"TK_Soldier_Medic_EP1" createUnit [_respawnpoint, _grp, "", 0.33, "SERGEANT"];
	"TK_Soldier_Medic_EP1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

	_grp
};
