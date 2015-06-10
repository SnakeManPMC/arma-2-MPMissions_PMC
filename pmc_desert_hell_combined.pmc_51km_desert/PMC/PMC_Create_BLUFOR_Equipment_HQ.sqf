
PMC_Create_BLUFOR_Equipment_HQ =
{
	private ["_p","_tent1","_tent2"];
	_p = _this select 0;

	"FlagCarrierUSA" createVehicle _p;
	"Land_Campfire" createVehicle _p;

	_tent1 = "Land_CamoNet_NATO_EP1" createVehicle [(_p select 0)-20,(_p select 1)];
	_tent1 setDir (random 360);
	_tent2 = "Land_CamoNet_NATO_EP1" createVehicle [(_p select 0)+20,(_p select 1)];
	_tent2 setDir (random 360);
	"HeliH" createVehicle [(_p select 0)+50, (_p select 1)];
	"HeliH" createVehicle [(_p select 0)-50, (_p select 1)];

	"MtvrRefuel" createVehicle [(_p select 0)-60,(_p select 1)+30];
	"MtvrRepair" createVehicle [(_p select 0),(_p select 1)+30];
	"MtvrReammo" createVehicle [(_p select 0)+60,(_p select 1)+30];
};
