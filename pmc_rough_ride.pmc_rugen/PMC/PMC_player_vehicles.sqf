/*

	Vehicles for player

*/
private
[
	"_pos",
	"_grp",
	"_grp2"
];

// just to make sure our location is chosen
waitUntil { !isNil "PMC_HQ"; };

_pos = PMC_HQ;

// create bunch of vehicles and all ammo boxes :)
{
	_newPos = [_pos, 0, 100, 10, 0, 0, 0] call BIS_fnc_findSafePos;
	createVehicle [_x, _newPos, [], 0, "NONE"];
} forEach
[
	"AAV",
	"AH1Z",
	"AH64D",
	"AH6J_EP1",
	"CH_47F_EP1",
	"CZBasicWeapons_EP1",
	"GERBasicWeapons_EP1",
	"GuerillaCacheBox",
	"GuerillaCacheBox_EP1",
	"HMMWV",
	"HMMWV_Ambulance",
	"HMMWV_Armored",
	"HMMWV_M2",
	"HMMWV_MK19",
	"HMMWV_TOW",
	"LAV25",
	"LocalBasicAmmunitionBox",
	"LocalBasicWeaponsBox",
	"M113_UN_EP1",
	"M119",
	"M1A1",
	"M252",
	"M2A2_EP1",
	"MH60S",
	"MTVR",
	"MtvrReammo",
	"MtvrRefuel",
	"MtvrRepair",
	"RUBasicAmmunitionBox",
	"RUBasicWeaponsBox",
	"RULaunchersBox",
	"RUOrdnanceBox",
	"RUSpecialWeaponsBox",
	"RUVehicleBox",
	"SpecialWeaponsBox",
	"TKBasicAmmunitionBox_EP1",
	"TKBasicWeapons_EP1",
	"TKLaunchers_EP1",
	"TKOrdnanceBox_EP1",
	"TKSpecialWeapons_EP1",
	"TKVehicleBox_EP1",
	"UH1Y",
	"UH60M_EP1",
	"UNBasicAmmunitionBox_EP1",
	"UNBasicWeapons_EP1",
	"USBasicAmmunitionBox",
	"USBasicAmmunitionBox_EP1",
	"USBasicWeapons_EP1",
	"USBasicWeaponsBox",
	"USLaunchers_EP1",
	"USLaunchersBox",
	"USOrdnanceBox",
	"USOrdnanceBox_EP1",
	"USSpecialWeapons_EP1",
	"USSpecialWeaponsBox",
	"USVehicleBox",
	"USVehicleBox_EP1"
];
