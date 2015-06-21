/*

PMC OPFOR convoy script

*/

private ["_grp","_myVec","_ptNum","_ran","_respawnpoint","_targetpoint","_tlogic","_vcl","_wp","_crewType","_PMC_convoyOPFORtargets"];

PMC_opfor_vehicle_heavy =
[
	"T34_TK_GUE_EP1",
	"T72_TK_EP1",
	"ZSU_TK_EP1"
];

PMC_opfor_vehicle_car_armed =
[
	"BMP2_HQ_TK_EP1",
	"BMP2_TK_EP1",
	"BRDM2_ATGM_TK_EP1",
	"BRDM2_HQ_TK_GUE_EP1",
	"BRDM2_TK_GUE_EP1",
	"BTR40_MG_TK_INS_EP1",
	"BTR60_TK_EP1",
	"GRAD_TK_EP1",
	"LandRover_MG_TK_INS_EP1",
	"LandRover_SPG9_TK_INS_EP1",
	"M113_TK_EP1",
	"UAZ_AGS30_TK_EP1",
	"UAZ_MG_TK_EP1",
	"Ural_ZU23_TK_EP1"
];

PMC_opfor_vehicle_car_unarmed =
[
	"M113Ambul_TK_EP1",
	"MAZ_543_SCUD_TK_EP1",
	"UAZ_Unarmed_TK_EP1",
	"Ural_TK_CIV_EP1",
	"UralReammo_TK_EP1",
	"UralRefuel_TK_EP1",
	"UralRepair_TK_EP1",
	"V3S_Open_TK_EP1",
	"V3S_Reammo_TK_GUE_EP1",
	"V3S_Refuel_TK_GUE_EP1",
	"V3S_Repair_TK_GUE_EP1",
	"V3S_Salvage_TK_GUE_EP1",
	"V3S_Supply_TK_GUE_EP1",
	"V3S_TK_EP1",
	"Volha_2_TK_CIV_EP1",
	"VolhaLimo_TK_CIV_EP1"
];

while {true} do
{
	// hard coded :(
	_respawnpoint = (getPosASL PMC_opfor_start_1);

	_myVec = objNull;
	_vcl = objNull;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle
	_myVec = (PMC_opfor_vehicle_heavy select floor random (count PMC_opfor_vehicle_heavy));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// second vehicle
	_myVec = (PMC_opfor_vehicle_heavy select floor random (count PMC_opfor_vehicle_heavy));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-40];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 3) moveInCommander _vcl;
	(units _grp select 4) moveInGunner _vcl;
	(units _grp select 5) moveInDriver _vcl;

	// third vehicle
	_myVec = (PMC_opfor_vehicle_car_armed select floor random (count PMC_opfor_vehicle_car_armed));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-80];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 6) moveInDriver _vcl;
	(units _grp select 7) moveInGunner _vcl;

	// fourth vehicle
	_myVec = (PMC_opfor_vehicle_car_armed select floor random (count PMC_opfor_vehicle_car_armed));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-120];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 8) moveInDriver _vcl;
	(units _grp select 9) moveInGunner _vcl;

	// fifth vehicle (cargo stuff?)
	_myVec = (PMC_opfor_vehicle_car_unarmed select floor random (count PMC_opfor_vehicle_car_unarmed));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-160];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 10) moveInDriver _vcl;

	// sixth vehicle (cargo stuff?)
	_myVec = (PMC_opfor_vehicle_car_unarmed select floor random (count PMC_opfor_vehicle_car_unarmed));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-200];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 11) moveInDriver _vcl;

	// seventh vehicle
	_myVec = (PMC_opfor_vehicle_car_unarmed select floor random (count PMC_opfor_vehicle_car_unarmed));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-240];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 12) moveInDriver _vcl;

	// eight, trailing vehicle (lets make it heavy)
	_myVec = (PMC_opfor_vehicle_heavy select floor random (count PMC_opfor_vehicle_heavy));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-260];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_crewType = getText (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Crew");
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	_crewType createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 13) moveInCommander _vcl;
	(units _grp select 14) moveInGunner _vcl;
	(units _grp select 15) moveInDriver _vcl;

	// increment the created units count
	missionNamespace setVariable ["PMC_opfor", (missionNamespace getVariable "PMC_opfor") + 16];
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	// do these need to be set, before waypoint 0 hmm?
	_grp setFormation "COLUMN";
	_grp setCombatMode "YELLOW";
	_grp setSpeedMode "NORMAL";
	_grp setBehaviour "SAFE";

	// selecting the waypoint locations
	_ptNum = count PMC_targets;
	_PMC_convoyOPFORtargets = [];
	_PMC_convoyOPFORtargets = PMC_targets;

	// do the random patrolling waypoints
	// twenty waypoints is more than enough
	_wp = 20;
	while {count _PMC_convoyOPFORtargets > 0} do
	{
		// choose random target.
		_ran = (floor random _ptNum);
		_tlogic = (_PMC_convoyOPFORtargets select _ran);
		// remove it from the temp array so it wont be chosen again.
		_PMC_convoyOPFORtargets = _PMC_convoyOPFORtargets - [_tlogic];
		// get its coordinates.
		_targetpoint = getPosASL _tlogic;
		_ptNum = _ptNum - 1;
		_wp = _wp + 1;

		// add waypoint to this target.
		_grp addWaypoint [_targetpoint, 0];
		[_grp, _wp] setWaypointBehaviour "SAFE";
		[_grp, _wp] setWaypointCombatMode "GREEN";
		[_grp, _wp] setWaypointSpeed "NORMAL";
		[_grp, _wp] setWaypointFormation "COLUMN";
		[_grp, _wp] setWaypointType "MOVE";
		// really big as this is a convoy
		[_grp, _wp] setWaypointCompletionRadius 500;
//		[_grp, _wp] setWaypointTimeout [min, mid, max];
		[_grp, _wp] setWaypointTimeout [60*2, 60*10, 60*20];
	};

	// add one last for cycle, so if he survives, he does it all over again.
	_wp = _wp + 1;
	_grp addWaypoint [_respawnpoint, 0];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "GREEN";
	[_grp, _wp] setWaypointSpeed "NORMAL";
	[_grp, _wp] setWaypointFormation "COLUMN";
	[_grp, _wp] setWaypointType "CYCLE";
	[_grp, _wp] setWaypointCompletionRadius 500;

	// some misc wait, we have time...
	sleep 60;

	// we wait until the convoy group is completely dead.
	waitUntil
	{
		// again, very very relaxed checking...
		sleep 60;
		((count units _grp) == 0);
	};

	// then we delete its group.
	waitUntil
	{
		deleteGroup _grp;
		(isNull _grp);
	};
	// and then we start the whole damn loop all over again :)
};
