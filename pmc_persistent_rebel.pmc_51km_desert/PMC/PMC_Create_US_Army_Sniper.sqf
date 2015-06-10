
PMC_Create_US_Army_Sniper =
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

	"US_Soldier_Sniper_EP1" createUnit [_respawnpoint, _grp, "", 1, "LIEUTENANT"];
	"US_Soldier_Spotter_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];

	_grp
};
