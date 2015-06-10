/*
	PMC VIP placement
	
Syntax:
[number of locations, distance to houses, map size] execVM "PMC\PMC_vip_placement.sqf";

Note that map size is counted from 0,0 bottom left corner to X,X top right corner.

Example:
[5, 500, 12800] execVM "PMC\PMC_vip_placement.sqf";

Requires:
PMC\PMC_Create_VIP.sqf

Returns:
-

*/

private ["_PMC_Create_VIP","_position","_mapSize","_x"];

_mapSize = _this select 2;
//_createMarker = compile preprocessFileLineNumbers "PMC\PMC_Create_Marker.sqf";
_PMC_Create_VIP = compile preprocessFileLineNumbers "PMC\PMC_Create_VIP.sqf";

// place the scud launcher groups here
PMC_vips = [];

for [{_x = 1}, {_x <= _this select 0}, {_x = _x + 1}] do
{
	_position = [(random _mapSize), (random _mapSize)];

	// choose new position while we have water OR houses closer than 100 meters.
	while { ( surfaceIsWater _position || (count (_position nearObjects ["house", _this select 1]) <= 2) ) } do
	{
		_position = [(random _mapSize), (random _mapSize), 0];

		if (surfaceIsWater _position) then
		{
			if (PMC_debug) then
			{
				diag_log format["PMC_vip_placement Position: %1 is WATER.", _position];
			};
		};

		if ( (count (_position nearObjects ["house", _this select 1]) <= 2) ) then
		{
			if (PMC_debug) then
			{
				diag_log format["PMC_vip_placement Position: %1 has NO houses closer than %2m!", _position, _this select 1];
			};
		};

	};
	
	//[_position] call _createMarker;
	[_position] call _PMC_Create_VIP;
	sleep 0.3;
};

waitUntil
{
	sleep 1;
	(count PMC_vips == _this select 0);
};
