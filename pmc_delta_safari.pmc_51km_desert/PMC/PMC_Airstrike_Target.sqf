/*

	Airstrike comes in with A10's to wipe out enemy vehicles

Syntax:
[strike position, respawnpoint] execVM "PMC\PMC_Airstrike_Target.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

// if we are on client, exit
if (!isServer) exitWith {};

private ["_p","_respawnpoint","_vcl","_grp"];

_p = _this select 0;
_respawnpoint = _this select 1;

diag_log format["PMC_Airstrike_Target (server side), _p: %1, _respawnpoint: %2", _p, _respawnpoint];

_vcl = createVehicle ["A10_US_EP1", _respawnpoint, [], 0, "FLY"];
_grp = createGroup west;
waitUntil {!(isNull _grp)};

"US_Soldier_Pilot_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInDriver _vcl;

// recycle the group
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

// these to function somehow nicely, please :(
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

_grp setbehaviour "COMBAT";
_grp setcombatmode "RED";
_grp setspeedmode "FULL";

// first just in case one simple move, no fuss, no huss
_vcl move _p;
// then we check if we are far away and automatically move him, if we are not, this returns umm nothing
// and the above move command continues to to take effect
[_vcl, _p] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

// small wait so he will start to move
sleep 10;

// wait until he is ready, DEAD or close to assault target.
waitUntil
{
	sleep 2;
	diag_log format["A10 airstrike closing in to target, distance: %1", (_vcl distance _p)];
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance _p < 500) );
};

diag_log "A10 just reached _p!";
PMC_Hint = "A10 in station!";
publicVariable "PMC_Hint";

// waypoints, we add couple to make patrol area
_grp addWaypoint [_p, 0];
// search and destroy waypoint
[_grp, 1] setWaypointType "SAD";
[_grp, 1] setWaypointCompletionRadius 200;

_grp addWaypoint [_p, 0];
[_grp, 2] setWaypointType "SAD";
[_grp, 2] setWaypointCompletionRadius 200;

_grp addWaypoint [_p, 0];
[_grp, 3] setWaypointType "MOVE";
[_grp, 3] setWaypointCompletionRadius 200;
[_grp, 3] setWaypointStatements ["true", "PMC_Hint = 'A10 reached MOVE waypoint, now what? heh'; publicVariable 'PMC_Hint';"];

sleep 5;

// just exit, no have any cool radio calls for player notifying him... but lets just exit from this script
if (!alive _vcl) exitWith
{
	diag_log "Tough luck, PMC_Airstrike_Target bird crashed heh";
};

// tricky checks if they have completed their "mission"
waitUntil
{
	diag_log format["looping while A10's strike some targets... %1", time];
	// very relaxed
	sleep 10;
	// they are:
	// all dead
	// leader ready
	( (!canMove _vcl) || (unitReady leader _grp) );
};

diag_log "Airstrike looping waituntil is done (one way or the other)";

// death check, assault is alive or dead
if ( (!alive _vcl) || (!canMove _vcl) ) exitWith
{
	diag_log "Strike Team assault group is dead hehe.";
};

diag_log "Airstrike death checks done, alive!";

// move back to the starting point
_vcl move _respawnpoint;

// move the helo
[_vcl, _respawnpoint] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

PMC_Hint = "A10 winchester, return to base.";
publicVariable "PMC_Hint";

// small wait so he will start to move
sleep 10;

// wait until he is ready, DEAD or close to home base.
waitUntil
{
	sleep 2;
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance _respawnpoint < 100) );
};

diag_log "Airstrike A10 is either dead, ready or close enough in home base?";

// just exit, no have any cool radio calls for player notifying him... but lets just exit from this script
if (!alive _vcl) exitWith
{
	diag_log "Tough luck, PMC_Strike_Team_Target bird crashed heh";
};

// wait and then delete the crew, the vehicle and the strike team
sleep 5;

{
	deleteVehicle _x;
} forEach units _grp;
deleteVehicle _vcl;

PMC_Hint = "A10 landing, mission complete!";
publicVariable "PMC_Hint";

diag_log "Airstrike mission is *COMPLETELY* done, all successfully completed, congrats! :-)";
