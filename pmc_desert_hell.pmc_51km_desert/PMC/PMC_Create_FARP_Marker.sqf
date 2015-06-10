
PMC_Create_FARP_Marker =
{
	private ["_targetpoint","_m","_markerobj"];
	_targetpoint = _this select 0;
	_m = _this select 1;
//	diag_log format["PMC_create_farp_marker.sqf. _targetpoint: %1 and _m: %2", _targetpoint, _m];
	_markerobj = createMarkerLocal [_m, _targetpoint];
	_markerobj setMarkerTypeLocal "Faction_US";
	_markerobj setMarkerShapeLocal "ICON"; //"ELLIPSE";
	_markerobj setMarkerColorLocal "ColorWhite";
//	_markerobj setMarkerBrush "Solid";
//	_markerobj setMarkerSize [200, 200];
	_markerobj setMarkerTextLocal _m;
	_markerobj setMarkerSizeLocal [1.5, 1];
};
