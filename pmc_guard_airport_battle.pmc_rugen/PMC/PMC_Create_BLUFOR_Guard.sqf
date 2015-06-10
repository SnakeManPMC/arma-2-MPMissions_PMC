
PMC_MakeGuardInfBLUFOR =
{
	private
	[
		"_grp",
		"_targetpoint",
		"_waypointRanPosit",
		"_respawnpoint"
	];

	_waypointRanPosit = 500;
	_respawnpoint = getPosASL pmc_blufor_start_1;
	_targetpoint = getPosASL pmc_hotspot;

	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"USMC_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"USMC_Soldier_TL" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"USMC_Soldier_GL" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"USMC_Soldier_MG" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"USMC_Soldier_AT" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"USMC_Soldier_TL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_GL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_MG" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"USMC_SoldierS_Sniper" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
hint "just created blufor guys!";
};
