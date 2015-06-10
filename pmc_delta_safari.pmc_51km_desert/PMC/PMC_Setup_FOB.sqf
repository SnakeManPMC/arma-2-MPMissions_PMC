/*

	Setup Fordward Operation Base (FOB)

Syntax:
[position] execVM "PMC\PMC_Setup_FOB.sqf";

Requires:
-

Returns:
-

*/

// if we are on client, exit
if (!isServer) exitWith {};

private
[
	"_abox1",
	"_abox2",
	"_abox3",
	"_m",
	"_markerobj",
	"_mash1",
	"_p",
	"_tent1",
	"_tent2",
	"_veh",
	"_pole"
];

_p = _this select 0;

diag_log format["PMC_Setup_FOB (server side), _p: %1", _p];

// stupid check
if (isNil 'PMC_FARP_Count') then
{
	PMC_FARP_Count = 0;
};

// errr?
// is this because onmapsingleclick puts height under ground? no idea
_p = [(_p select 0), (_p select 1), 0];

_pole = createVehicle ["FlagCarrierUSA", _p, [], 0, "NONE"];
// doesnt seem to work on clients?
[_pole] execVM "PMC\PMC_viewdistance_flagpole.sqf";
"Land_Fire" createVehicle _p;

// two tents
_tent1 = "CampEast_EP1" createVehicle [(_p select 0)-20,(_p select 1)];
_tent1 setDir random 360;
_tent2 = "CampEast_EP1" createVehicle [(_p select 0)+20,(_p select 1)];
_tent2 setDir random 360;

// helipads
"HeliH" createVehicle [(_p select 0)+50, (_p select 1)];
"HeliH" createVehicle [(_p select 0)-50, (_p select 1)];

// field hospital
_mash1 = "MASH" createVehicle [(_p select 0)+20, (_p select 1)+20];
_mash1 setDir random 360;

// ammo boxes
_abox1 = "USSpecialWeapons_EP1" createVehicle [(_p select 0)+30, (_p select 1)+10];
_abox1 setDir random 360;

_abox2 = "USBasicAmmunitionBox_EP1" createVehicle [(_p select 0)+40, (_p select 1)+15];
_abox2 setDir random 360;

_abox3 = "USLaunchers_EP1" createVehicle [(_p select 0)+30, (_p select 1)+20];
_abox3 setDir random 360;

// support trucks
"MtvrRefuel" createVehicle [(_p select 0)-60,(_p select 1)+30];
"MtvrRepair" createVehicle [(_p select 0),(_p select 1)+30];
"MtvrReammo" createVehicle [(_p select 0)+60,(_p select 1)+30];

_veh = createVehicle ["LandRover_Special_CZ_EP1", [(_p select 0)+60, (_p select 1)+60], [], 0, "NONE"];
[_veh, 3600, 3600, 0, false, false] execVM "PMC\vehicle_respawn.sqf";

// marker is not Local so it will be broadcasted to all clients
_m = format ["PMC_FARP_%1", PMC_FARP_Count];
_markerobj = createMarker [_m, _p];
_markerobj setMarkerShape "ELLIPSE";
_markerobj setMarkerColor "ColorBlue";
_markerobj setMarkerBrush "Solid";
_markerobj setMarkerSize [200, 200];

_m = format ["PMC_FARP_text_%1", PMC_FARP_Count];
_markerobj = createMarker [_m, _p];
_markerobj setMarkerType "mil_dot";
_markerobj setMarkerColor "ColorBlue";
_markerobj setMarkerText format["FARP: %1", PMC_FARP_Count];

PMC_FARP_Count = PMC_FARP_Count + 1;
publicVariable "PMC_FARP_Count";

// move respawn marker here.
"respawn_west" setMarkerPos (_this select 0);

// this doesnt work for clients on some reason?
_m = format ["Field Operating Bases are setup:</br></br><marker name='PMC_FARP_text_%1'>FOB 0</marker></br>", PMC_FARP_Count];

diag_log format["This should go to SHK: %1", _m];
[[
],[
	["FOB", _m]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";
