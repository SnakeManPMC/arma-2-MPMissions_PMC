
private
[
	"_countUnits",
	"_grp",
	"_ran",
	"_Max_BLUFOR_On_Map",
	"_respawnpoint",
	"_sleeptime",
	"_targetpoint",
	"_num",
	"_victoryCondition"
];

// debug to see if the script is still running
PMC_war_blufor = true;
publicVariable "PMC_war_blufor";

// how many blufor to create
_victoryCondition = call compile preprocessFileLineNumbers "PMC\PMC_Get_Victory_Condition.sqf";

// maximum number of opfor on the map at one time
_Max_BLUFOR_On_Map = call compile preprocessFileLineNumbers "PMC\PMC_Get_Max_Units.sqf";

// random sleep time
_sleeptime = (5 + random 2);

// PMC_Create_US_Army
call compile preprocessFileLineNumbers "PMC\PMC_Create_US_Army.sqf";

// PMC_patrol_vehicle_blufor
call compile preprocessFileLineNumbers "PMC\PMC_patrol_vehicle_blufor.sqf";

// PMC_Create_US_Army_Sniper
call compile preprocessFileLineNumbers "PMC\PMC_Create_US_Army_Sniper.sqf";

// PMC_Create_US_Army_Support
call compile preprocessFileLineNumbers "PMC\PMC_Create_US_Army_Support.sqf";

// PMC_Create_US_ArmyWeapons
call compile preprocessFileLineNumbers "PMC\PMC_Create_US_ArmyWeapons.sqf";

// PMC_Create_US_DeltaForce
call compile preprocessFileLineNumbers "PMC\PMC_Create_US_DeltaForce.sqf";

// czhech guys

// PMC_Create_ACR_Squad
call compile preprocessFileLineNumbers "PMC\PMC_Create_ACR_Squad.sqf";

// PMC_Create_ACR_SpecialForcesTeam
call compile preprocessFileLineNumbers "PMC\PMC_Create_ACR_SpecialForcesTeam.sqf";

// Germans
// PMC_Create_GER_Infantry_KSKTeam
call compile preprocessFileLineNumbers "PMC\PMC_Create_GER_Infantry_KSKTeam.sqf";

// count group units
_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

// wait until mission starts and pmc_bluforunits trigger is usable.
waitUntil
{
	(count (list pmc_bluforunits) > 0);
};

// first base defence for airbase
[] execVM "PMC\PMC_Base_Defence_BLUFOR.sqf";
sleep 1;

while {PMC_blufor < _victoryCondition} do
{
	if ((WEST countSide (list pmc_bluforunits)) < _Max_BLUFOR_On_Map && (PMC_InfTransport < 10) && (diag_fps > 20)) then
	{
		// random starting location
		_respawnpoint = ["BLUFOR"] call PMC_SelectStartPosit;

		_ran = floor (random 9);
		switch (_ran) do
		{
			case 0:
			{
				// create 1st squad of BLUFOR
				_grp = [_respawnpoint] call PMC_Create_US_Army;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_US_Army! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 1:
			{
				_grp = [_respawnpoint] call PMC_patrol_vehicle_blufor;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_patrol_vehicle_blufor! PMC_blufor: %1", PMC_blufor]; };

			};
			case 2:
			{
				_grp = [_respawnpoint] call PMC_Create_US_Army_Sniper;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_US_Army_Sniper! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 3:
			{
				_grp = [_respawnpoint] call PMC_Create_US_Army_Support;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_US_Army_Support! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 4:
			{
				_grp = [_respawnpoint] call PMC_Create_US_ArmyWeapons;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_US_ArmyWeapons! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 5:
			{
				_grp = [_respawnpoint] call PMC_Create_US_DeltaForce;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_US_DeltaForce! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 6:
			{
				_grp = [_respawnpoint] call PMC_Create_ACR_Squad;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_ACR_Squad! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 7:
			{
				_grp = [_respawnpoint] call PMC_Create_ACR_SpecialForcesTeam;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_ACR_SpecialForcesTeam! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
			case 8:
			{
				_grp = [_respawnpoint] call PMC_Create_GER_Infantry_KSKTeam;
				waitUntil {!(isNull _grp)};

				// add our created enemies
				_num = [_grp] call _countUnits;
				PMC_blufor = PMC_blufor + _num;
				publicVariable "PMC_blufor";
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Create_GER_Infantry_KSKTeam! PMC_blufor: %1", PMC_blufor]; };

				// select target
				_targetpoint = call PMC_Select_Target;

				// create helicopter to ferry them into target, if far enough
				if (_respawnpoint distance _targetpoint > 1000) then
				{
					[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
				};
			};
		};

		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_blufor = PMC_grp_blufor + 1;
		publicVariable "PMC_grp_blufor";

		_ran = floor (random 3);
		switch (_ran) do
		{
			case 0:
		    	{
				//player sidechat format["blufor case 0, patrol inf waypoints. _grp: %1", _grp];
				// PMC_Patrol_Inf_Waypoints
				[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Patrol_Inf_Waypoints.sqf, _grp: %1", _grp]; };
		    	};
			case 1:
			{
				//player sidechat format["blufor case 1, guard inf waypoints. _grp: %1", _grp];
				// PMC_Guard_Inf_Waypoints
				[_grp, _targetpoint, 0] call PMC_Guard_Inf_Waypoints;
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Guard_Inf_Waypoints.sqf, _grp: %1", _grp]; };
			};
			case 2:
			{
				//player sidechat format["blufor case 3, sentry inf waypoints. _grp: %1", _grp];
				// PMC_Sentry_Inf_Waypoints
				[_grp, _targetpoint, 100] call PMC_Sentry_Inf_Waypoints;
if (PMC_debug) then { diag_log format["BLUFOR: call PMC_Sentry_Inf_Waypoints.sqf, _grp: %1", _grp]; };
			};
		};

		// global once per loop announce ;)
		if (PMC_debug) then { diag_log format["BLUFOR: %1 (%2), OPFOR: %3 (%4), KIA: %5, FPS: %6", PMC_blufor, PMC_grp_blufor, PMC_opfor, PMC_grp_opfor, PMC_killedNum, diag_fps]; };
	};
	sleep _sleeptime;
};

// debug to see if the script is still running
PMC_war_blufor = false;
publicVariable "PMC_war_blufor";
diag_log format["PMC_WAR_BLUFOR.SQF EXITED! PMC_blufor: %1. PMC_opfor: %2. time: %3", PMC_blufor, PMC_opfor, time];

// shut down helicopter and aircraft scripts too
PMC_aircraft_blufor_running = false;
PMC_helo_blufor_running = false;
publicVariable "PMC_aircraft_blufor_running";
publicVariable "PMC_helo_blufor_running";
