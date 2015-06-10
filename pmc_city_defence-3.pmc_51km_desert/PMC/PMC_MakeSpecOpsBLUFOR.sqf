
PMC_MakeSpecOpsBLUFOR =
{
private ["_grp","_respawnpoint","_targetpoint","_waypointRanPosit"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        _waypointRanPosit = _this select 2;
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};
	"FR_AR" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	"FR_Marksman" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"FR_Light" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
	"FR_R" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"FR_Sapper" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	// increment the created units count
	PMC_blufor = PMC_blufor + 5;
	publicVariable "PMC_blufor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	_grp setFormation "WEDGE";
	_grp setSpeedMode "FULL";

	// waypoints, we add couple to make patrol area
	// first
	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, 1] setWaypointBehaviour "COMBAT";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointType "MOVE";

	// second
	_grp addWaypoint [_targetpoint, _waypointRanPosit*5];
	[_grp, 2] setWaypointType "MOVE";

	// cycle
	_grp addWaypoint [_targetpoint, 0];
	[_grp, 3] setWaypointType "CYCLE";

	// WIP transport stuff
	[_grp,_respawnpoint,_targetpoint,"West"] execVM "PMC\PMC_infTransport.sqf";
        _grp
};
