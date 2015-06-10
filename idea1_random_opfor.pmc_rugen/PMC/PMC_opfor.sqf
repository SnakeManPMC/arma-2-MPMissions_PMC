/*

	OPFOR war script

*/

private
[
	"_a",
	"_ForceLevel",
	"_grp",
	"_myVec",
	"_PMC_Make_OPFOR_Soft_Vehicles",
	"_PMC_MakeTankOPFOR",
	"_PMC_MakeTankOPFORHeavy",
	"_PMC_tempOPFORtargets",
	"_ran",
	"_rand",
	"_respawnpoint",
	"_targetNum",
	"_targetpoint",
	"_tlogic",
	"_vcl",
	"_waypointRanPosit",
	"_wp"
];

/*

	One single tank

*/
_PMC_MakeTankOPFOR =
{
	_myVec = (PMC_opfor_vehicle_heavy select floor random _maxOPFORA);
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_vcl setPos _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 3;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};

/*

	Platoon of 4 tanks

*/
_PMC_MakeTankOPFORHeavy =
{
	_myVec = (PMC_opfor_vehicle_heavy select floor random _maxOPFORA);
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_vcl setPos _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle	
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInCommander _vcl;
	(units _grp select 1) moveInGunner _vcl;
	(units _grp select 2) moveInDriver _vcl;

	// second vehicle
	_vcl = objNull;
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 3) moveInCommander _vcl;
	(units _grp select 4) moveInGunner _vcl;
	(units _grp select 5) moveInDriver _vcl;

	// third vehicle	
	_vcl = objNull;
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 6) moveInCommander _vcl;
	(units _grp select 7) moveInGunner _vcl;
	(units _grp select 8) moveInDriver _vcl;

	// fourth vehicle	
	_vcl = objNull;
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 9) moveInCommander _vcl;
	(units _grp select 10) moveInGunner _vcl;
	(units _grp select 11) moveInDriver _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 12;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};

/*

	Artillery site 4 D-30 guns

*/
_PMC_MakeArtillerySite =
{
	_myVec = "D30_RU";
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	_vcl setPos _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// first vehicle	
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "LIEUTENANT"];
	(units _grp select 0) moveInGunner _vcl;

	// second vehicle
	_vcl = objNull;
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)+50,0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 1) moveInGunner _vcl;

	// third vehicle	
	_vcl = objNull;
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)-50,0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 2) moveInGunner _vcl;

	// fourth vehicle	
	_vcl = objNull;
	_vcl = _myVec createVehicle [(_respawnpoint select 0),(_respawnpoint select 1)+100,0];
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "PRIVATE"];
	(units _grp select 3) moveInGunner _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 4;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
};

/*

	Single armed car

*/
_PMC_MakeArmedCar =
{
	_myVec = (PMC_opfor_vehicle_car_armed select floor random _maxOPFORA2);
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl setPos _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "CORPORAL"];
	(units _grp select 0) moveInDriver _vcl;
	(units _grp select 1) moveInGunner _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 2;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};


_PMC_Make_OPFOR_Soft_Vehicles =
{
	_myVec = (PMC_opfor_vehicle_car_unarmed select floor random _maxOPFORB);
	_vcl = _myVec createVehicle _respawnpoint;
	_vcl setPos _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"RU_Soldier_Crew" createUnit [_respawnpoint, _grp, "", (random 1), "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 1;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "AWARE";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};

_PMC_MakeHind =
{
	private
	[
		"_tmp",
		"_i"
	];

	_tmp =
	[
		"Mi17_rockets_RU",
		"Mi17_rockets_RU"
	];

	_myVec = (_tmp select floor random (count _tmp));
	_vcl = _myVec createVehicle _respawnpoint;
	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};
	
	"RU_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "SERGEANT"];
	(units _grp select 0) moveInDriver _vcl;

	_i = 0;
	// check if have turrets, then creates gunners for them.
	for "_i" from 0 to ((count (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Turrets")) - 1) do
	{
		"RU_Soldier_Pilot" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
		(units _grp select (_i+1)) moveinTurret [_vcl,[_i]];
	};

	// increment the created units count
	PMC_opfor = PMC_opfor + 1;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	_grp setSpeedMode "FULL";
	_grp setFormation "WEDGE";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "AWARE";
	[_grp, _wp] setWaypointCombatMode "RED";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "WEDGE";
	[_grp, _wp] setWaypointType "GUARD";
};

_PMC_MakeSupport =
{
	private
	[
		"_tmp"
	];

	_tmp =
	[
		"UralReammo_INS",
		"UralRefuel_INS",
		"UralRepair_INS"
	];

	_grp = objNull;
	_grp = createGroup east;
	waitUntil {!(isNull _grp)};

	// truck drivers	
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "SERGEANT"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "CORPORAL"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	// security vehicle
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", random 1, "PRIVATE"];
	"RU_Soldier" createUnit [_respawnpoint, _grp, "", 1, "PRIVATE"];

	// truck 1
	_myVec = (_tmp select floor random (count _tmp));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 0) moveInDriver _vcl;

	// truck 2
	_myVec = (_tmp select floor random (count _tmp));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 1) moveInDriver _vcl;

	// truck 3
	_myVec = (_tmp select floor random (count _tmp));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 2) moveInDriver _vcl;

	// truck 3
	_myVec = (_tmp select floor random (count _tmp));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 3) moveInDriver _vcl;

	// security vehicle
	_myVec = (PMC_opfor_vehicle_car_armed select floor random (count PMC_opfor_vehicle_car_armed));
	_vcl = _myVec createVehicle _respawnpoint;
	(units _grp select 4) moveInDriver _vcl;
	(units _grp select 5) moveInGunner _vcl;

	// increment the created units count
	PMC_opfor = PMC_opfor + 4;
	publicVariable "PMC_opfor";

	// these to function somehow nicely, please :(
	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
	} forEach units _grp;
	_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

	_grp setBehaviour "SAFE";
	_grp setCombatMode "BLUE";
	_grp setSpeedMode "FULL";
	_grp setFormation "COLUMN";

	_wp = 1;

	_grp addWaypoint [_targetpoint, _waypointRanPosit];
	[_grp, _wp] setWaypointBehaviour "SAFE";
	[_grp, _wp] setWaypointCombatMode "BLUE";
	[_grp, _wp] setWaypointSpeed "FULL";
	[_grp, _wp] setWaypointFormation "COLUMN";
	[_grp, _wp] setWaypointType "SUPPORT";
};


_PMC_SelectOPFORStartPosit =
{
	// select one starting point
	_ran = (floor random (count PMC_targets));
	_tlogic = (PMC_targets select _ran);
	_respawnpoint = [(getPosASL _tlogic select 0)-50+random 100,(getPosASL _tlogic select 1)-50+random 100];

	// place the value to be returned like this at the end in function!
	_respawnpoint
};

// how many cycles of troops we create. 20 creates about 150-180 units.
_ForceLevel = 80;

_maxOPFORA = count PMC_opfor_vehicle_heavy;
_maxOPFORA2 = count PMC_opfor_vehicle_car_armed;
_maxOPFORB = count PMC_opfor_vehicle_car_unarmed;
_maxOPFORC = count PMC_opfor_helo_armed;
_maxOPFORD = count PMC_opfor_jet;

// our waypoints random circle range
_waypointRanPosit = 1000;

// create units
_a = 0;
PMC_opfor = 0;
//while { _a < _ForceLevel or _a > (count PMC_targets) } do
while { _a < _ForceLevel } do
{
	_a = _a + 1;

	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	// workaround for being lazy.
	_targetpoint = _respawnpoint;

	_rand = floor (random 7);
	switch (_rand) do
	{
		case 0:
	    	{
			// Single tank
			[] call _PMC_MakeTankOPFOR;
	    	};
	    	case 1:
	    	{
			// Single armed car
			[] call _PMC_MakeArmedCar;
	    	};
		case 2:
		{
			// Platoon of 4 tanks
			[] call _PMC_MakeTankOPFORHeavy;
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
		};
		case 3:
		{
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
		};
		case 4:
		{
			// Artillery site 4 D-30 guns
			[] call _PMC_MakeArtillerySite;
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
			[] call _PMC_Make_OPFOR_Soft_Vehicles;
		};
		case 5:
		{
			// Hinds
			[] call _PMC_MakeHind;
		};
		case 6:
		{
			// Support trucks
			[] call _PMC_MakeSupport;
		};
/*
		case 5:
		{
			// SA-2 launcher.
			call compile preprocessFileLineNumbers "PMC\PMC_create_sa2_site.sqf";
		};
*/
	};
	sleep 1;
	/*
	_kura = createMarker [format["kura%1",_a], _respawnpoint];
	_kura setMarkerType "flag";
	_kura setMarkerText format["%1",_a];
	*/
};

diag_log format["OPFOR script exited with: %1 units created.", PMC_opfor];
