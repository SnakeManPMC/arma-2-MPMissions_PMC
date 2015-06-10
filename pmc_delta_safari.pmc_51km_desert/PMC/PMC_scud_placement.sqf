/*
	PMC SCUD launcher placement script
	
Syntax:
[number of locations, distance to houses, map size] execVM "PMC\PMC_scud_placement.sqf";

Note that map size is counted from 0,0 bottom left corner to X,X top right corner.

Example:
[5, 500, 12800] execVM "PMC\PMC_scud_placement.sqf";

Requires:
PMC\PMC_Create_SCUD_launcher.sqf

Returns:
-

*/

private ["_PMC_Create_SCUD_launcher","_position","_mapSize","_x","_grp"];

_mapSize = _this select 2;
//_createMarker = compile preprocessFileLineNumbers "PMC\PMC_Create_Marker.sqf";
_PMC_Create_SCUD_launcher = compile preprocessFileLineNumbers "PMC\PMC_Create_SCUD_launcher.sqf";

// place the scud launcher groups here
PMC_scuds = [];

for [{_x = 1}, {_x <= _this select 0}, {_x = _x + 1}] do
{
	_position = [(random _mapSize), (random _mapSize)];

	// choose new position while we have water OR houses closer than 100 meters.
	while { ( surfaceIsWater _position || (count (_position nearObjects ["house", _this select 1]) > 0) ) } do
	{
		_position = [(random _mapSize), (random _mapSize), 0];

		if (surfaceIsWater _position) then
		{
			if (PMC_debug) then
			{
				diag_log format["PMC_scud_placement Position: %1 is WATER.", _position];
			};
		};
		
		if ( (count (_position nearObjects ["house", 500]) > 0) ) then
		{
			if (PMC_debug) then
			{
				diag_log format["PMC_scud_placement Position: %1 has house closer than %2m!", _position, _this select 1];
			};
		};
	};
	
	//[_position] call _createMarker;
	[_position] call _PMC_Create_SCUD_launcher;
	sleep 0.3;
	// create security for the SCUD site
	_grp = [_position] execVM "PMC\PMC_Create_Takistani_Militia.sqf";
	[_grp, _position, 200] execVM "PMC\PMC_Sentry_Inf_Waypoints.sqf";
};

waitUntil
{
	sleep 1;
	(count PMC_scuds == _this select 0);
};
