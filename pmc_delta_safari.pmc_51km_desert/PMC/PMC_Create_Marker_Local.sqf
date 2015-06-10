/*
	PMC Create Marker
	
Syntax:
_createMarker = compile preprocessFileLineNumbers "PMC\PMC_Create_Marker.sqf";

Requires:
-

Returns:
marker name

*/

private
[
	"_position",
	"_m",
	"_marker"
];

_position = _this select 0;

diag_log format["PMC_Create_Marker_Local _position: %1", _position];

_m = format["pmc_marker_%1", round (random 1000)];

_marker = createMarkerLocal [_m, _position];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "mil_objective";

_m
