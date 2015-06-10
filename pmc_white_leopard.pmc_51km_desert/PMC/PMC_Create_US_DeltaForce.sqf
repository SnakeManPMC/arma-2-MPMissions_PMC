
PMC_Create_US_DeltaForce =
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

	"US_Delta_Force_TL_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	"US_Delta_Force_MG_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	"US_Delta_Force_Assault_EP1" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"US_Delta_Force_Marksman_EP1" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];

	_grp
};
