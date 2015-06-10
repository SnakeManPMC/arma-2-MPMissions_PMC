
private
[
	"_countUnits",
	"_grp",
	"_ran",
	"_Max_OPFOR_On_Map",
	"_respawnpoint",
	"_sleeptime",
	"_targetpoint",
	"_num",
	"_victoryCondition"
];

// debug to see if the script is still running
PMC_war_opfor = true;
publicVariable "PMC_war_opfor";

// how many enemies to create
// ArmA 2 group limit per side is 144 ?
// 500 / 10 = 50 groups.
// 1400 / 10 = 140 groups.
_victoryCondition = call compile preprocessFileLineNumbers "PMC\PMC_Get_Victory_Condition.sqf";

// maximum number of opfor on the map at one time
_Max_OPFOR_On_Map = call compile preprocessFileLineNumbers "PMC\PMC_Get_Max_Units.sqf";

// random sleep time
_sleeptime = (5 + random 2);

// PMC_Create_Takistani_Army
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Army.sqf";

// PMC_Create_Takistani_Militia
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Militia.sqf";

// PMC_patrol_vehicle_opfor
call compile preprocessFileLineNumbers "PMC\PMC_patrol_vehicle_opfor.sqf";

// PMC_Create_Takistani_Army_Sniper
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Sniper.sqf";

// PMC_Create_Takistani_Army_Support
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Support.sqf";

// PMC_Create_Takistani_Special
call compile preprocessFileLineNumbers "PMC\PMC_Create_Takistani_Army_Special_Purpose.sqf";

// count group units
_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

// wait until mission starts and pmc_opforunits trigger is usable.
waitUntil
{
	(count (list pmc_opforunits) > 0);
};

// first base defence for airbase
[] execVM "PMC\PMC_Base_Defence_OPFOR.sqf";
sleep 1;

while {PMC_opfor < _victoryCondition} do
{
	if ((EAST countSide (list pmc_opforunits)) < _Max_OPFOR_On_Map && (PMC_InfTransport < 10) && (diag_fps > 20)) then
	{
		// random starting location
		_respawnpoint = ["OPFOR"] call PMC_SelectStartPosit;
//if (PMC_debug) then { diag_log format["PMC_opfor: %1 < _victoryCondition: %2", PMC_opfor, _victoryCondition]; };
		_ran = floor (random 6);
//if (PMC_debug) then { diag_log format["PMC_war_opfor.sqf: group create: _ran: %1", _ran]; };
		switch (_ran) do
		{
			case 0:
			{
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: group create: case 0."; };
//		pmc_var1 = "going to create group: militia.";
				// create 1st squad of OPFOR
				_grp = [_respawnpoint] call PMC_Create_Takistani_Militia;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_opfor = PMC_opfor + _num;
				publicVariable "PMC_opfor";
//				player sidechat format["opfor case 0, created militia. _grp: %1. pmc_opfor: %2", _grp, PMC_opfor];
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Create_Takistani_Militia! PMC_opfor: %1", PMC_opfor]; };

				// select target
				_targetpoint = call PMC_Select_Target;
		
				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
				};
			};
			case 1:
			{
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: group create: case 1."; };
//		pmc_var1 = "going to create group: vehicle.";
				_grp = [_respawnpoint] call PMC_patrol_vehicle_opfor;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_opfor = PMC_opfor + _num;
				publicVariable "PMC_opfor";
//				player sidechat format["opfor case 1, created vehicle. _grp: %1. pmc_opfor: %2", _grp, PMC_opfor];
if (PMC_debug) then { diag_log format["OPFOR: call PMC_patrol_vehicle_opfor! PMC_opfor: %1", PMC_opfor]; };

				// select target
				_targetpoint = call PMC_Select_Target;
			};
			case 2:
			{
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: group create: case 2."; };
//		pmc_var1 = "going to create group: sniper.";
				_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Sniper;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_opfor = PMC_opfor + _num;
				publicVariable "PMC_opfor";
//				player sidechat format["opfor case 2, created sniper. _grp: %1. pmc_opfor: %2", _grp, PMC_opfor];
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Create_Takistani_Army_Sniper! PMC_opfor: %1", PMC_opfor]; };

				// select target
				_targetpoint = call PMC_Select_Target;
		
				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
				};
			};
			case 3:
			{
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: group create: case 3."; };
//		pmc_var1 = "going to create group: support.";
				_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Support;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_opfor = PMC_opfor + _num;
				publicVariable "PMC_opfor";
//				player sidechat format["opfor case 3, created support. _grp: %1. pmc_opfor: %2", _grp, PMC_opfor];
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Create_Takistani_Army_Support! PMC_opfor: %1", PMC_opfor]; };

				// select target
				_targetpoint = call PMC_Select_Target;
		
				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
				};
			};
			case 4:
			{
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: group create: case 4."; };
//		pmc_var1 = "going to create group: army.";
				_grp = [_respawnpoint] call PMC_Create_Takistani_Army;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_opfor = PMC_opfor + _num;
				publicVariable "PMC_opfor";
//				player sidechat format["opfor case 4, created army. _grp: %1. pmc_opfor: %2", _grp, PMC_opfor];
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Create_Takistani_Army! PMC_opfor: %1", PMC_opfor]; };

				// select target
				_targetpoint = call PMC_Select_Target;
		
				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
				};
			};
			case 5:
			{
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: group create: case 5."; };
//		pmc_var1 = "going to create group: army.";
				_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Special_Purpose;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_opfor = PMC_opfor + _num;
				publicVariable "PMC_opfor";
//				player sidechat format["opfor case 4, created army. _grp: %1. pmc_opfor: %2", _grp, PMC_opfor];
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Create_Takistani_Special! PMC_opfor: %1", PMC_opfor]; };

				// select target
				_targetpoint = call PMC_Select_Target;
		
				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
				};
			};
		};

//pmc_var1 = "groups created, going to choose WP.";
//publicVariable "pmc_var1";
//if (PMC_debug) then { diag_log "PMC_war_opfor.sqf: groups created, going to choose WP."; };

		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_opfor = PMC_grp_opfor + 1;
		publicVariable "PMC_grp_opfor";

		_ran = floor (random 3);
//if (PMC_debug) then { diag_log format["PMC_war_opfor.sqf: waypoints: _ran: %1", _ran]; };
		switch (_ran) do
		{
			case 0:
		    	{
//				player globalchat format["WP opfor case 1, patrol inf waypoints. _grp: %1", _grp];
				// PMC_Patrol_Inf_Waypoints
				[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Patrol_Inf_Waypoints! _grp: %1", _grp]; };
		    	};
			case 1:
			{
//				player globalchat format["WP opfor case 1, guard inf waypoints. _grp: %1", _grp];
				// PMC_Guard_Inf_Waypoints
				[_grp, _targetpoint, 0] call PMC_Guard_Inf_Waypoints;
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Guard_Inf_Waypoints! _grp: %1", _grp]; };
			};
			case 2:
			{
//				player globalchat format["WP opfor case 3, sentry inf waypoints. _grp: %1", _grp];
				// PMC_Sentry_Inf_Waypoints
				[_grp, _targetpoint, 100] call PMC_Sentry_Inf_Waypoints;
if (PMC_debug) then { diag_log format["OPFOR: call PMC_Sentry_Inf_Waypoints! _grp: %1", _grp]; };
			};
		};

		// global once per loop announce ;)
		if (PMC_debug) then { diag_log format["BLUFOR: %1 (%2), OPFOR: %3 (%4), KIA: %5, FPS: %6", PMC_blufor, PMC_grp_blufor, PMC_opfor, PMC_grp_opfor, PMC_killedNum, diag_fps]; };
	};

//	pmc_var1 = "going to sleep.";
//	publicVariable "pmc_var1";
//if (PMC_debug) then { diag_log format["PMC_war_opfor.sqf: going to sleep, time: %1", time]; };
	sleep _sleeptime;
};

// debug to see if the script is still running
PMC_war_opfor = false;
publicVariable "PMC_war_opfor";
diag_log format["PMC_war_opfor.sqf EXITED! PMC_opfor: %1. PMC_blufor: %2. time: %3", PMC_opfor, PMC_blufor, time];

// shut down helicopter and aircraft scripts too
PMC_aircraft_opfor_running = false;
PMC_helo_opfor_running = false;
publicVariable "PMC_aircraft_opfor_running";
publicVariable "PMC_helo_opfor_running";
