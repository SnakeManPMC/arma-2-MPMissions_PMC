
private ["_newPos","_safePos","_fish"];

// place player in random pos
_newPos = (PMC_loc select floor (random (count PMC_loc)));

_fish = [(_newPos select 0), (_newPos select 1) - 200, 0];

//_safePos = [_fish, 0, 100, 10, 0, 20, 0] call BIS_fnc_findSafePos;

//player setPos _safePos;
{_x setPosASL _fish} forEach units group player;

// return the original city position
_newPos
