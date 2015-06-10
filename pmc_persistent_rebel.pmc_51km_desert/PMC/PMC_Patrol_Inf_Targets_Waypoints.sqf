/*

this guy is bit more complex, this will do crazy waypoint loop around all
the PMC_targets array gamelogics.

It goes from first to next until all have been gone through.

This will ensure no target / objective is left unchecked.

Syntax:
[group, waypoint_random_radius] execVM "PMC\PMC_Patrol_Inf_Targets_Waypoints.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

PMC_Patrol_Inf_Targets_Waypoints =
{
	private
	[
		"_grp",
		"_PMC_temp_targets",
		"_ran",
		"_respawnpoint",
		"_targetpoint",
		"_tlogic",
		"_waypointRanPosit",
		"_wp"
	];
	_grp = _this select 0;
	_waypointRanPosit = _this select 1;
	_respawnpoint = getPosASL leader _grp;

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	_grp setbehaviour "SAFE";
	_grp setcombatmode "RED";
	_grp setspeedmode "LIMITED";
	_grp setformation "WEDGE";

	// temporary array which we will clean eventually.
	_PMC_temp_targets = PMC_targets;

	// do the random patrolling waypoints
	_wp = 0;
	// this one seems like too heavy, creates 606 waypoints :)
//	while {count _PMC_temp_targets > 0} do
	// this is only 5 targets, much less waypoints.
	for "_i" from 0 to 5 do
	{
		_ran = (floor random (count _PMC_temp_targets));
		_tlogic = (_PMC_temp_targets select _ran);
		_PMC_temp_targets = _PMC_temp_targets - [_tlogic];
		_targetpoint = getPosASL _tlogic;
		_wp = _wp + 1;

//diag_log format["_grp: %1, _PMC_temp_targets: %2, _wp: %3", _grp, _tlogic, _wp];

		_grp addWaypoint [_targetpoint, 0];
		[_grp, _wp] setWaypointBehaviour "SAFE";
		[_grp, _wp] setWaypointCombatMode "RED";
		[_grp, _wp] setWaypointSpeed "FULL";
		[_grp, _wp] setWaypointFormation "WEDGE";
		[_grp, _wp] setWaypointType "MOVE";
		[_grp, _wp] setWaypointTimeout [60*2, 60*10, 60*20]; // min, mid, max
		[_grp, _wp] setWaypointCompletionRadius 50;

		// 1st patrol point around the waypoint ;)
		_wp = _wp + 1;
		_grp addWaypoint [_targetpoint, _waypointRanPosit * 2];
		[_grp, _wp] setWaypointBehaviour "AWARE";
		[_grp, _wp] setWaypointCombatMode "RED";
		[_grp, _wp] setWaypointSpeed "LIMITED";
		[_grp, _wp] setWaypointFormation "LINE";
		[_grp, _wp] setWaypointType "SAD";
		[_grp, _wp] setWaypointTimeout [60*1, 60*2, 60*5];
		[_grp, _wp] setWaypointCompletionRadius 50;

		// 2nd patrol point
		_wp = _wp + 1;
		_grp addWaypoint [_targetpoint, _waypointRanPosit * 2];
		[_grp, _wp] setWaypointBehaviour "AWARE";
		[_grp, _wp] setWaypointCombatMode "RED";
		[_grp, _wp] setWaypointSpeed "LIMITED";
		[_grp, _wp] setWaypointFormation "LINE";
		[_grp, _wp] setWaypointType "SAD";
		[_grp, _wp] setWaypointTimeout [60*1, 60*2, 60*5];
		[_grp, _wp] setWaypointCompletionRadius 50;

		// 3rd patrol point
		_wp = _wp + 1;
		_grp addWaypoint [_targetpoint, _waypointRanPosit * 2];
		[_grp, _wp] setWaypointBehaviour "AWARE";
		[_grp, _wp] setWaypointCombatMode "RED";
		[_grp, _wp] setWaypointSpeed "LIMITED";
		[_grp, _wp] setWaypointFormation "LINE";
		[_grp, _wp] setWaypointType "SAD";
		[_grp, _wp] setWaypointTimeout [60*1, 60*2, 60*5];
		[_grp, _wp] setWaypointCompletionRadius 50;

		// 4th patrol point
		_wp = _wp + 1;
		_grp addWaypoint [_targetpoint, _waypointRanPosit * 2];
		[_grp, _wp] setWaypointBehaviour "AWARE";
		[_grp, _wp] setWaypointCombatMode "RED";
		[_grp, _wp] setWaypointSpeed "LIMITED";
		[_grp, _wp] setWaypointFormation "LINE";
		[_grp, _wp] setWaypointType "SAD";
		[_grp, _wp] setWaypointTimeout [60*1, 60*2, 60*5];
		[_grp, _wp] setWaypointCompletionRadius 50;

		// we are done, loop back to start and go to next target
	};

	// add one last for cycle, so if he survives, he does it all over again.
	_wp = _wp + 1;
	_grp addWaypoint [_respawnpoint, 0];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "CYCLE";
	[_grp, _wp] setWaypointTimeout [60*2, 60*10, 60*20];
	[_grp, _wp] setWaypointCompletionRadius 50;

//diag_log format["_grp: %1, Targets WP creation is DONE! _wp: %2", _grp, _wp];
};
