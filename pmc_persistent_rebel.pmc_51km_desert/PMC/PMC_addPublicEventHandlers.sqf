
// if you are client on the server, you get this marker.
// if you JIP after this has been created, you wont see it
"PMC_Downed_Aircraft" addPublicVariableEventhandler
{
	private ["_markerobj", "_m"];

	_m = format ["PMC_Aircraft_%1", (round random 1000)];
	_markerobj = createMarkerLocal [_m, getPosASL (_this select 1)];
	_markerobj setMarkerTypeLocal "mil_pickup";
	_markerobj setMarkerColorLocal "ColorBlue";
	_markerobj setMarkerTextLocal format ["%1", _m];

	hintSilent "Downed Aircraft Marker Placed!\n\nCheck map.";
	
	[_m] spawn { sleep 1800; (_this select 0) setMarkerColorLocal "ColorBlack"; sleep 1800; deleteMarker (_this select 0); };
};

"PMC_Downed_Helicopter" addPublicVariableEventhandler
{
	private ["_markerobj", "_m"];

	_m = format ["PMC_Helo_%1", (round random 1000)];
	_markerobj = createMarkerLocal [_m, getPosASL (_this select 1)];
	_markerobj setMarkerTypeLocal "mil_pickup";
	_markerobj setMarkerColorLocal "ColorBlue";
	_markerobj setMarkerTextLocal format ["%1", _m];

	hintSilent "Downed Helicopter Marker Placed!\n\nCheck map.";

	[_m] spawn { sleep 1800; (_this select 0) setMarkerColorLocal "ColorBlack"; sleep 1800; deleteMarker (_this select 0); };
};
