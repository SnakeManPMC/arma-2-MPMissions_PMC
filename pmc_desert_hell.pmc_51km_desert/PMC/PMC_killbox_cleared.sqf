/*

	Setup FARP in cleared killbox.

Syntax:
handle = [killbox1] execVM "PMC\PMC_killbox_cleared.sqf";
is launched from the triggers activation line.

Requires:
-

Returns:
-

*/

private ["_killboxname", "_targetpoint", "_m"];

_killboxname = _this select 0;
_targetpoint = getPosASL _killboxname;

// for dedicated server in multiplayer
if (isServer) then
{
//	diag_log format["PMC_killbox_cleared.sqf (SERVER) _targetpoint getPosASL _killboxname: %1", _targetpoint];
	[_targetpoint] call PMC_Create_BLUFOR_Equipment_HQ;

	PMC_FARP_Count = PMC_FARP_Count + 1;
	publicVariable "PMC_FARP_Count";
}
else
{
	// not sure if we need this for the above publicVariable for clients?
	sleep 1;
	_m = format ["PMC_FARP_%1", PMC_FARP_Count];
//	diag_log format["PMC_killbox_cleared.sqf (CLIENT) _targetpoint: %1 and _m: %2", _targetpoint, _m];
	[_targetpoint, _m] call PMC_Create_FARP_Marker;
};
