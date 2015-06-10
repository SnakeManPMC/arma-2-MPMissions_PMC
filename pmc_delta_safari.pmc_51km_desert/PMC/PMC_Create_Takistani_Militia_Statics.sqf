
PMC_Create_Takistani_Militia_Statics =
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
		"2b14_82mm_TK_INS_EP1",
		"AGS_TK_INS_EP1",
		"D30_TK_INS_EP1",
		"DSHkM_Mini_TriPod_TK_INS_EP1",
		"DSHKM_TK_INS_EP1",
		"SPG9_TK_INS_EP1",
		"ZU23_TK_INS_EP1"
	];

	_respawnpoint = _this select 0;
	_myVec = (_vehicle_list select floor random (count _vehicle_list));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl setDir random 360;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"TK_INS_Soldier_EP1" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInGunner _vcl;

	_grp
};
