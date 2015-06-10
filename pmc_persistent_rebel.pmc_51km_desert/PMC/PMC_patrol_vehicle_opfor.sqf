/*
	PMC_patrol_vehicle_opfor.sqf

Syntax:
[respawnpoint] execVM "PMC\PMC_patrol_vehicle_opfor.sqf";

Requires:
PMC\PMC_killed.sqf
PMC\PMC_create_crew.sqf

Returns:
-

*/

PMC_patrol_vehicle_opfor =
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
		"BMP2_HQ_TK_EP1",
		"BMP2_TK_EP1",
		"BRDM2_ATGM_TK_EP1",
		"BRDM2_TK_EP1",
		"BTR40_MG_TK_INS_EP1",
		"BTR40_TK_INS_EP1",
		"BTR60_TK_EP1",
		"GRAD_TK_EP1",
		"LandRover_MG_TK_EP1",
		"LandRover_SPG9_TK_EP1",
		"M113_TK_EP1",
		"MAZ_543_SCUD_TK_EP1",
		"T34_TK_EP1",
		"T55_TK_EP1",
		"T72_TK_EP1",
		"UAZ_AGS30_TK_EP1",
		"UAZ_MG_TK_EP1",
		"UAZ_Unarmed_TK_EP1",
		"Ural_TK_CIV_EP1",
		"Ural_ZU23_TK_EP1",
		"V3S_Open_TK_EP1",
		"V3S_TK_EP1"
	];

	_respawnpoint = _this select 0;
	_myVec = (_vehicle_list select floor random (count _vehicle_list));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"TK_Soldier_GL_EP1" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	[_vcl, _grp] execVM "PMC\PMC_create_crew.sqf";

	// increment the created units count
	PMC_opfor = PMC_opfor + 2;
	publicVariable "PMC_opfor";

	PMC_grp_opfor = PMC_grp_opfor + 1;
	publicVariable "PMC_grp_opfor";

	_grp setBehaviour "SAFE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	if (PMC_debug) then
	{
		diag_log format["PMC_patrol_vehicle_opfor: _vcl: %1, _grp: %2", typeOf _vcl, _grp];
	};

	_grp
};
