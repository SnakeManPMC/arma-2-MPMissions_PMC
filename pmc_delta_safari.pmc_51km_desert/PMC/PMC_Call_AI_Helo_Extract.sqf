/*

Syntax:
this = [pickup, respawnpoint] execVM "PMC\PMC_Call_AI_Helo_Extract.sqf";

Returns:
AI helo flies to you, picks you up, then flies you back to respawnpoint

*/

private ["_lz","_respawnpoint","_grp","_vcl","_tmp"];

hint "welcome to AI pickup script!";

_lz = _this select 0;
_respawnpoint = _this select 1;

_vcl = createVehicle ["UH60M_EP1", _respawnpoint, [], 0, "FLY"];
_grp = objNull;
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

_grp setbehaviour "AWARE";
_grp setcombatmode "GREEN";
_grp setspeedmode "FULL";
_grp setformation "WEDGE";

// move the helo
// first just in case one simple move, no fuss, no huss
_vcl move _lz;
// then we check if we are far away and automatically move him, if we are not, this returns umm nothing
// and the above move command continues to to take effect
[_vcl, _lz] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

// small wait so he will start to move
sleep 10;

// wait until he is ready, DEAD or close to LZ.
waitUntil
{
	sleep 2;
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance _lz < 100) );
};

// just exit, no have any cool radio calls for player notifying him... but lets just exit from this script
if (!alive _vcl) exitWith { diag_log "Tough luck, extract bird crashed heh"; };

// land her
_vcl land "get in";

sleep 5;

waitUntil
{
	sleep 0.5;
	((!alive _vcl) || (getPos _vcl select 2 < 2));
};

// hold her still!
_vcl flyInHeight 0;

// sixty seconds should be enough time for player to get onboard
sleep 60;

_vcl flyInHeight 100;

// move back to the starting point
_vcl move _respawnpoint;

// move the helo
[_vcl, _respawnpoint] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

// small wait so he will start to move
sleep 10;

// wait until he is ready, DEAD or close to LZ.
waitUntil
{
	sleep 2;
	( (!alive _vcl) || (unitReady _vcl) || (_vcl distance _lz < 100) );
};

// just exit, no have any cool radio calls for player notifying him... but lets just exit from this script
if (!alive _vcl) exitWith { diag_log "Tough luck, extract bird crashed heh"; };

// land and get the crew out
_vcl land "get out";

sleep 5;

// very experimental lock stuff!
waitUntil
{
	sleep 1;
	(getPos _vcl select 2 < 2);
};

// still one small sleep
sleep 5;
// lock her up!
_vcl lock true;

// wait and then delete the crew and the vehicle
sleep 60;

{
	deleteVehicle _x;
} forEach units _grp;
deleteVehicle _vcl;
