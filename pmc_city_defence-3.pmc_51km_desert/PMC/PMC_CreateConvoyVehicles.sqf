
PMC_blufor_vehicle_heavy = ["M1A2_TUSK_MG"];
PMC_blufor_vehicle_soft = ["M2A2_EP1","M2A2_EP1","M1135_ATGMV_EP1","M1126_ICV_M2_EP1","M1126_ICV_mk19_EP1"];
PMC_blufor_vehicle_car_unarmed = ["MTVR","MTVR","HMMWV"];
PMC_blufor_vehicle_car_armed = ["MTVR","HMMWV_M2","HMMWV_MK19","HMMWV_TOW"];
PMC_blufor_helo_armed = ["AH1Z","AH6J_EP1","AH6J_EP1","MH60S","UH60M_EP1"];

PMC_CreateConvoyVehicles =
{
        private ["_grp","_myVec","_vcl","_respawnpoint","_wp","_targetpoint"];

        _respawnpoint = _this select 0;
        _targetpoint = _this select 1;
        
        _myVec = objNull;
	_vcl = objNull;
	_grp = objNull;
	_grp = createGroup west;
	waitUntil {!(isNull _grp)};

	// first vehicle
	_myVec = (PMC_blufor_vehicle_heavy select round random ((count PMC_blufor_vehicle_heavy) - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// second vehicle
	_myVec = (PMC_blufor_vehicle_heavy select round random ((count PMC_blufor_vehicle_heavy) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-40];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 3) moveInCommander _vcl;
	(units _grp select 4) moveInGunner _vcl;
	(units _grp select 5) moveInDriver _vcl;

	// third vehicle
	_myVec = (PMC_blufor_vehicle_soft select round random ((count PMC_blufor_vehicle_soft) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-80];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 6) moveInDriver _vcl;
	(units _grp select 7) moveInGunner _vcl;

	// fourth vehicle
	_myVec = (PMC_blufor_vehicle_soft select round random ((count PMC_blufor_vehicle_soft) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-120];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 8) moveInDriver _vcl;
	(units _grp select 9) moveInGunner _vcl;

	// fifth vehicle (important vehicle with gunner)
	_myVec = (PMC_blufor_vehicle_car_armed select round random ((count PMC_blufor_vehicle_car_armed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-160];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 10) moveInDriver _vcl;
	(units _grp select 11) moveInGunner _vcl;

	// sixth vehicle
	_myVec = (PMC_blufor_vehicle_car_unarmed select round random ((count PMC_blufor_vehicle_car_unarmed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-200];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 12) moveInDriver _vcl;
	(units _grp select 13) moveInCargo _vcl;

	// seventh vehicle (important vehicle with gunner)
	_myVec = (PMC_blufor_vehicle_car_armed select round random ((count PMC_blufor_vehicle_car_armed) - 1));
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-240];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	"USMC_Soldier" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_SL" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 14) moveInDriver _vcl;
	(units _grp select 15) moveInGunner _vcl;

	// eight, trailing vehicle (lets make it heavy)
	_myVec = (PMC_blufor_vehicle_heavy select round random ((count PMC_blufor_vehicle_heavy) - 1));
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"USMC_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 16) moveInCommander _vcl;
	(units _grp select 17) moveInGunner _vcl;
	(units _grp select 18) moveInDriver _vcl;

	// new one, Gunship helo!
	// nine, airsupport
	_vcl = createVehicle ["AH1Z", _respawnpoint, [], 0, "FLY"];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	"USMC_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];
	(units _grp select 19) moveInGunner _vcl;
	(units _grp select 20) moveInDriver _vcl;

	// increment the created units count
	missionNameSpace setVariable ["PMC_blufor", ((missionNamespace getVariable "PMC_blufor") + 21)];
	publicVariable "PMC_blufor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} foreach units _grp;

	// do these need to be set, before waypoint 0 hmm?
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
	[_grp, _wp] setWaypointTimeout [60*2, 0, 60*20];
	[_grp, _wp] setWaypointType "GUARD";

	// return the group name
	_grp
};
