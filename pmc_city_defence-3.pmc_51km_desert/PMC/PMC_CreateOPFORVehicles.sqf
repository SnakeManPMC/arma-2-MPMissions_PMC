
PMC_opfor_vehicle_heavy = ["BMP2_INS","BMP2_INS","ZSU_INS","T72_RU","T72_RU"];
PMC_opfor_vehicle_car_armed = ["UAZ_AGS30_RU","UAZ_MG_INS","BRDM2_INS","BRDM2_ATGM_INS"];
PMC_opfor_vehicle_car_unarmed = ["UralRepair_INS","UralReammo_INS","UralRefuel_INS","Ural_TK_CIV_EP1","UralOpen_INS","UAZ_RU"];

PMC_CreateOPFORVehicles =
{
private ["_grp","_myVec","_vcl","_respawnpoint","_all_OPFOR_vecH","_wp","_targetpoint"];
_all_OPFOR_vecH = ["Ka52","Mi17_rockets_RU","Mi17_rockets_RU"];
        
        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        
        _myVec = objNull;
	_vcl = objNull;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle
        _myVec = (PMC_opfor_vehicle_heavy select round random ((count PMC_opfor_vehicle_heavy) - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// second vehicle
	_myVec = (PMC_opfor_vehicle_heavy select round random ((count PMC_opfor_vehicle_heavy) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-40];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 3) moveInCommander _vcl;
	(units _grp select 4) moveInGunner _vcl;
	(units _grp select 5) moveInDriver _vcl;

	// third vehicle
	_myVec = (PMC_opfor_vehicle_car_armed select round random ((count PMC_opfor_vehicle_car_armed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-80];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 6) moveInDriver _vcl;
	(units _grp select 7) moveInGunner _vcl;

	// fourth vehicle
	_myVec = (PMC_opfor_vehicle_car_armed select round random ((count PMC_opfor_vehicle_car_armed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-120];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 8) moveInDriver _vcl;
	(units _grp select 9) moveInGunner _vcl;

	// fifth vehicle (cargo stuff?)
	_myVec = (PMC_opfor_vehicle_car_unarmed select round random ((count PMC_opfor_vehicle_car_unarmed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-160];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"RU_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 10) moveInDriver _vcl;
	(units _grp select 11) moveInCargo _vcl;

	// sixth vehicle (cargo stuff?)
	_myVec = (PMC_opfor_vehicle_car_unarmed select round random ((count PMC_opfor_vehicle_car_unarmed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-200];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"RU_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 12) moveInDriver _vcl;
	(units _grp select 13) moveInCargo _vcl;

	// seventh vehicle
	_myVec = (PMC_opfor_vehicle_car_unarmed select round random ((count PMC_opfor_vehicle_car_unarmed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-240];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"RU_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 14) moveInDriver _vcl;
	(units _grp select 15) moveInCargo _vcl;

	// eight, trailing vehicle (lets make it heavy)
	_myVec = (PMC_opfor_vehicle_heavy select round random ((count PMC_opfor_vehicle_heavy) - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 16) moveInCommander _vcl;
	(units _grp select 17) moveInGunner _vcl;
	(units _grp select 18) moveInDriver _vcl;

	// new one, helo!
	// nine, airsupport
	_myVec = (_all_OPFOR_vecH select round random ((count _all_OPFOR_vecH) - 1));
	_vcl = createVehicle [_myVec, _respawnpoint, [], 0, "FLY"];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"RU_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"RU_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	(units _grp select 19) moveInGunner _vcl;
	(units _grp select 20) moveInDriver _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 21;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	_grp setFormation "COLUMN";
	_grp setSpeedMode "NORMAL";

	_wp = 1;
	// add waypoint to this target.
	_grp addWaypoint [_targetpoint, 0];
	[_grp, _wp] setWaypointBehaviour "COMBAT";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointFormation "COLUMN";
	[_grp, _wp] setWaypointSpeed "NORMAL";
	[_grp, _wp] setWaypointType "GUARD";
};
