/*

	Strike Team comes in with UH60 and blows ragheads up

Syntax:
[strike position, respawnpoint] execVM "PMC\PMC_Strike_Team_Target.sqf";

Requires:
PMC\PMC_killed.sqf

Returns:
-

*/

// if we are on client, exit
if (!isServer) exitWith {};

if (!isNil "PMC_Strike_Team_On_Mission") exitWith
{
	PMC_Strike_Team_On_Mission = true;
};

private ["_p","_respawnpoint","_vcl","_grp","_tmp","_assault","_lz"];

_p = _this select 0;
_respawnpoint = _this select 1;

diag_log format["PMC_Strike_Team_Target (server side), _p: %1, _respawnpoint: %2", _p, _respawnpoint];

_vcl = createVehicle ["UH60M_EP1", _respawnpoint, [], 0, "FLY"];
_grp = createGroup west;
waitUntil {!(isNull _grp)};

"US_Soldier_Pilot_EP1" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
(units _grp select 0) moveInDriver _vcl;

// create helo crew
_tmp = [_vcl, _grp] execVM "PMC\PMC_Create_Crew.sqf";

// wait until crew has been created, then proceed to add killed EH.
waitUntil
{
	scriptDone _tmp;
};

// recycle the group
[_grp] execVM "PMC\PMC_groupRecycle.sqf";

// these to function somehow nicely, please :(
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _grp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

// careless, we just take the guys to the LZ, thats all
_grp setbehaviour "CARELESS";
// green, hold fire, defend only
_grp setcombatmode "GREEN";
_grp setspeedmode "FULL";
_grp setformation "WEDGE";

// create US Army strike team
call compile preprocessFileLineNumbers "PMC\PMC_Create_US_Army.sqf";

_assault = [_respawnpoint] call PMC_Create_US_Army;
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} foreach units _assault;

// move them into the helicopter
{
	_x assignAsCargo _vcl;
	_x moveInCargo _vcl;
} forEach units _assault;

// move the helo

// choose landing zone away from the target because there might be ZU23 + DSHKM setups. This is really
// difficult as dunno how to make double onmapsingleclick setups one for LZ and one for target.
// this is like 500m away from the target, maybe thats enough. but its always hardcoded, sigh
_lz = [[(_p select 0) - 500, (_p select 1) - 500, 0], 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;

// first just in case one simple move, no fuss, no huss
_vcl move _lz;
// then we check if we are far away and automatically move him, if we are not, this returns umm nothing
// and the above move command continues to to take effect
[_vcl, _lz] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

PMC_Hint = format["%1 reporting, %2 onboard and we are on our way.", _vcl, _assault];
publicVariable "PMC_Hint";

// small wait so he will start to move
sleep 10;

// wait until he is ready, DEAD or close to assault target.
waitUntil
{
	sleep 2;
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance _lz < 100) );
};

diag_log "Strike Team helo reached _lz!";

// just exit, no have any cool radio calls for player notifying him... but lets just exit from this script
if (!alive _vcl) exitWith
{
	PMC_Strike_Team_On_Mission = false;
	diag_log "Tough luck, PMC_Strike_Team_Target bird crashed heh";
};

// land her
_vcl land "get out";

PMC_Hint = "Inserting Strike Team now!";
publicVariable "PMC_Hint";

sleep 5;

// to aware so they wont be total sitting ducks
_grp setbehaviour "AWARE";

waitUntil
{
	sleep 0.5;
	((!alive _vcl) || (getPos _vcl select 2 < 2));
};

diag_log "Strike Team helo landed on _lz!";

// hold her still!
_vcl flyInHeight 0;

// order strike team disembark
{
	unassignVehicle _x
} forEach units _assault;

// when done helo flies overhead to cover
sleep 3;
_vcl flyInHeight 50;
_vcl move [(_p select 0) + random 500, (_p select 1) + random 500, 0];
_grp setBehaviour "COMBAT";
_grp setCombatMode "RED";
_grp setSpeedMode "FULL";

diag_log "Strike Team helo ordered to loiter _lz!";

// strike team does its thing
_assault setbehaviour "AWARE";
_assault setcombatmode "RED";
_assault setspeedmode "FULL";
_assault setformation "LINE";

// waypoints, we add couple to make patrol area
_assault addWaypoint [_p, 0];
// search and destroy waypoint
[_assault, 1] setWaypointType "SAD";
[_assault, 1] setWaypointCompletionRadius 25;

// tricky checks if they have completed their "mission"
waitUntil
{
	diag_log format["looping while strike team is doing its thing... units: %1, leader ready: %2, time: %3", (count units _assault), (unitReady leader _assault), time];
	// very relaxed
	sleep 10;
	// they are:
	// all dead
	// leader ready
	( (count units _assault == 0) || (unitReady leader _assault) );
};

PMC_Hint = "Strike Team reporting, all clear, area secured!";
publicVariable "PMC_Hint";

diag_log "Strike Team looping waituntil is done (one way or the other)";

// death check, assault is alive or dead
if ( (count units _assault == 0) ) exitWith
{
	PMC_Strike_Team_On_Mission = false;
	diag_log "Strike Team assault group is dead hehe.";
	_vcl move _respawnpoint;
};

// assault team is ready and alive

// death check for helicopter, assault just walks home and stays there unfotunately
if ( (!alive _vcl) || (!canMove _vcl) ) exitWith
{
	PMC_Strike_Team_On_Mission = false;
	diag_log "Strike Team helicopter is dead etc, hehe.";
	// long walk, haha
	leader _assault move _respawnpoint;
};

diag_log "Strike Team death checks done, both alive and apparently strike teams mission is accomplished? ordering units in";

// assault & helicopter is alive, whee!

PMC_Hint = "Strike Team extraction started!";
publicVariable "PMC_Hint";

// helicopter behaviour again to bit more calm
_grp setbehaviour "AWARE";

// helo moves closer to strike team
_vcl move getPosASL leader _assault;

// wait until he is ready, DEAD or close to assault group.
waitUntil
{
	sleep 2;
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance (leader _assault) < 200) );
};

diag_log format["Strike Team helicoper is ready for pickup, distance: %1", (_vcl distance leader _assault)];

// helo lands back in to pickup strike team
{
	_x assignAsCargo _vcl;
	[_x] orderGetIn true;
} forEach units _assault;

// helo flies back to base
sleep 10;

_vcl flyInHeight 100;

// move back to the starting point
_vcl move _respawnpoint;

// move the helo
[_vcl, _respawnpoint] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

// small wait so he will start to move
sleep 10;

// wait until he is ready, DEAD or close to home base.
waitUntil
{
	sleep 2;
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance _respawnpoint < 100) );
};

diag_log "Strike Team helo is either dead, ready or close enough in home base?";

// just exit, no have any cool radio calls for player notifying him... but lets just exit from this script
if (!alive _vcl) exitWith
{
	PMC_Strike_Team_On_Mission = false;
	diag_log "Tough luck, PMC_Strike_Team_Target bird crashed heh";
};

// wait and then delete the crew, the vehicle and the strike team
sleep 5;

{
	deleteVehicle _x;
} forEach (units _grp + units _assault);
deleteVehicle _vcl;

PMC_Strike_Team_On_Mission = false;

PMC_Hint = "Strike Team reporting, at home base, mission complete!";
publicVariable "PMC_Hint";

diag_log "Strike Team mission is *COMPLETELY* done, all successfully completed, congrats! :-)";
