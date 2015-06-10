
//_tmp = [_vcl, _landingzone] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";

private ["_lastWaypoint","_ActStep","_posX","_posY","_vcl","_targetpoint","_startingPoint","_maxDistance","_Xend","_Yend","_Xstart","_Ystart","_SubSteps","_dX","_dY"];

_vcl = _this select 0;
_targetpoint = _this select 1;

_startingPoint = getPosASL _vcl;
_maxDistance = 4000;

// how many meters is the minimum needed to start plot waypoints
// 6km is roughly the decent amount, in desert terrain even this is short
// but more dense vegetated terrains it is cool amount.

// if we are too close to plot any waypoints, exit and return 0.
if (_startingPoint distance _targetpoint < _maxDistance) exitWith
{
	if (PMC_debug) then { diag_log format["PMC_plotWaypoints early exit, distance only: %1 m. Returning waypoints 0.", (_targetpoint distance _startingPoint)]; };
	_lastWaypoint = 0;
	_lastWaypoint
};

_Xend = _targetpoint select 0;
_Yend = _targetpoint select 1;
_Xstart = _startingPoint select 0;
_Ystart = _startingPoint select 1;

// umm this tries to make the substeps little less, 
// but still dynamic according to the distance to travel.
_SubSteps = ((floor (_startingPoint distance _targetpoint)) / _maxDistance);

if (PMC_debug) then { diag_log format["PMC_plotWaypoints: substeps: %1, _vcl: %2, _targetpoint: %3", _SubSteps, _vcl, _targetpoint]; };

_dX = _Xend - _Xstart;
_dY = _Yend - _Ystart;
_ActStep = 0;
_posX = 0;
_posY = 0;

// while we have waypoints, vehicle can move and is alive...
while { (_ActStep < _SubSteps) && (canMove _vcl && alive _vcl) } do
{
	_ActStep = _ActStep + 1;
	_posX = _Xstart + (_dX * _ActStep / _SubSteps);
	_posY = _Ystart + (_dY * _ActStep / _SubSteps);
	_vcl move [_posX, _posY];
	
	// wait until we are ready OR cannot move OR are dead
	waitUntil { sleep 1; (unitReady _vcl || !canMove _vcl || !alive _vcl); };
};

if (PMC_debug) then { diag_log format["PMC_plotWaypoints exited, alive _vcl: %1, canMove: %2, pos: %3, dist to target: %4", alive _vcl, canMove _vcl, (getPosASL _vcl), (getPosASL _vcl distance _targetpoint)]; };
