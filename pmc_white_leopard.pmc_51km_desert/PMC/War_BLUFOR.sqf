
private ["_grp","_PMC_blufor","_ran","_targetpoint","_Max_BLUFOR_On_Map","_victoryCondition","_sleeptime","_respawnpoint","_countUnits","_pos","_safePos"];

// maximum number of opfor on the map at one time
_Max_BLUFOR_On_Map = 50;

// how many units to create until ending the loop
_victoryCondition = 500;

// counter for how many units have been created
_PMC_blufor = 0;

// random sleep time
_sleeptime = (2 + random 5);

// hardcoded to airbase 3 for blufor units
_respawnpoint = [1854, 2448, 0];

_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

while {_PMC_blufor < _victoryCondition} do
{
	// this is too often, few seconds
	//diag_log format["evaluating BLUFOR: %1", (count list pmc_blufor_list)];
	// new added check is && (diag_fps > 15), hopefully it wont kill gameplay totally :)
	if (('man' countType list pmc_blufor_list) < _Max_BLUFOR_On_Map) then
	{
		if ((PMC_InfTransport < 10) && (diag_fps > 15) && ([(list pmc_blufor_list)] call PMC_countGroups) < 144) then
		{
			_ran = floor (random 8);
			switch (_ran) do
			{
				case 0:
				{
					_grp = [_respawnpoint] call PMC_Create_US_Army;
				};
				case 1:
				{
					_grp = [_respawnpoint] call PMC_Create_US_Army_Sniper;
				};
				case 2:
				{
					_grp = [_respawnpoint] call PMC_Create_US_Army_Support;
				};
				case 3:
				{
					_grp = [_respawnpoint] call PMC_Create_US_ArmyWeapons;
				};
				case 4:
				{
					_grp = [_respawnpoint] call PMC_Create_US_DeltaForce;
				};
				case 5:
				{
					_grp = [_respawnpoint] call PMC_Create_ACR_Squad;
				};
				case 6:
				{
					_grp = [_respawnpoint] call PMC_Create_ACR_SpecialForcesTeam;
				};
				case 7:
				{
					_grp = [_respawnpoint] call PMC_Create_GER_Infantry_KSKTeam;
				};
			};

			waitUntil {!(isNull _grp)};

			_PMC_blufor = _PMC_blufor + ([_grp] call _countUnits);

			// put group into recycle script
			[_grp] execVM "PMC\PMC_groupRecycle.sqf";

			// add one group created.
			PMC_grp_blufor = PMC_grp_blufor + 1;

			diag_log format["Created new BLUFOR group of : %1", (count units _grp)];

			// select target
			_targetpoint = PMC_loc select (random (count PMC_loc));
			// jiggle the fucker as it was array of cooridinates
			pmc_temp_logic setPos _targetpoint;

			// waypoints
			_ran = floor (random 3);
			switch (_ran) do
			{
				case 0:
			    	{
					[_grp, pmc_temp_logic, 100] call PMC_Patrol_Inf_Waypoints;
			    	};
				case 1:
				{
					[_grp, pmc_temp_logic, 0] call PMC_Guard_Inf_Waypoints;
				};
				case 2:
				{
					[_grp, pmc_temp_logic, 100] call PMC_Sentry_Inf_Waypoints;
				};
			};

			// create helicopter to ferry them into target
			_pos = [1854, 2448, 0];
			_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			pmc_homebase setPos _safePos;
			[_grp, pmc_homebase, pmc_temp_logic] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
		};
	};

	diag_log format["[(list pmc_blufor_list)] call PMC_countGroups: %1", ([(list pmc_blufor_list)] call PMC_countGroups)];

	sleep _sleeptime;
};

diag_log "War_BLUFOR has just exited!";
