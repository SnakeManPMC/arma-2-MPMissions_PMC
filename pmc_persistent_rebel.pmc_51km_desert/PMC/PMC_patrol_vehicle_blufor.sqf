/*
	PMC_patrol_vehicle_blufor.sqf

Syntax:
[respawnpoint] execVM "PMC\PMC_patrol_vehicle_blufor.sqf";

Requires:
PMC\PMC_create_crew.sqf
PMC\PMC_killed.sqf

Return:
-

*/

PMC_patrol_vehicle_blufor =
{
	private
	[
		"_grp",
		"_myVec",
		"_respawnpoint",
		"_vcl",
		"_vehicle_list"
	];

	_vehicle_list =
	[
		"HMMWV_Ambulance_DES_EP1",
		"HMMWV_Avenger_DES_EP1",
		"HMMWV_DES_EP1",
		"HMMWV_M1035_DES_EP1",
		"HMMWV_M1151_M2_DES_EP1",
		"HMMWV_M1151_M2_DES_EP1",
		"HMMWV_M998_crows_M2_DES_EP1",
		"HMMWV_M998_crows_MK19_DES_EP1",
		"HMMWV_M998A2_SOV_DES_EP1",
		"HMMWV_MK19_DES_EP1",
		"HMMWV_Terminal_EP1",
		"HMMWV_TOW_DES_EP1",
		"M1126_ICV_M2_EP1",
		"M1126_ICV_mk19_EP1",
		"M1128_MGS_EP1",
		"M1129_MC_EP1",
		"M1130_CV_EP1",
		"M1135_ATGMV_EP1",
		"M1A1_US_DES_EP1",
		"M1A2_US_TUSK_MG_EP1",
		"M2A2_EP1",
		"M2A3_EP1",
		"M6_EP1",
		"MTVR_DES_EP1",
		"MTVR_DES_EP1",
		"MtvrReammo_DES_EP1",
		"MtvrRefuel_DES_EP1",
		"MtvrRepair_DES_EP1"
	];

	_respawnpoint = _this select 0;

	_myVec = (_vehicle_list select floor random (count _vehicle_list));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	"US_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	[_vcl, _grp] execVM "PMC\PMC_create_crew.sqf";

	// increment the created units count
	PMC_blufor = PMC_blufor + 2;
	publicVariable "PMC_blufor";

	PMC_grp_blufor = PMC_grp_blufor + 1;
	publicVariable "PMC_grp_blufor";

	_grp setBehaviour "SAFE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

diag_log format["PMC_patrol_vehicle_blufor: _vcl: %1, _grp: %2", typeOf _vcl, _grp];

	_grp
};
