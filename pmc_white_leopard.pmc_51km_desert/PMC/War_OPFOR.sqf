
private ["_grp","_PMC_opfor","_ran","_targetpoint","_Max_OPFOR_On_Map","_victoryCondition","_sleeptime","_respawnpoint","_countUnits","_pos","_safePos"];

// maximum number of opfor on the map at one time
_Max_OPFOR_On_Map = 50;

// how many units to create until ending the loop
_victoryCondition = 500;

// counter for how many units have been created
_PMC_opfor = 0;

// random sleep time
_sleeptime = (2 + random 5);

// hardcoded to near harbor 4 for opfor units
_respawnpoint = [9944, 49088, 0];

_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";

while {_PMC_opfor < _victoryCondition} do
{
	// this is too often, few seconds
	//diag_log format["evaluating OPFOR: %1", (count list pmc_opfor_list)];
	// new added feature is && (diag_fps > 15), hopefully it wont kill gameplay totally :)
	if (('man' countType list pmc_opfor_list) < _Max_OPFOR_On_Map) then
	{
		if ((PMC_InfTransport < 10) && (diag_fps > 15) && ([(list pmc_opfor_list)] call PMC_countGroups) < 144) then
		{
			_ran = floor (random 5);
			switch (_ran) do
			{
				case 0:
				{
					_grp = [_respawnpoint] call PMC_Create_Takistani_Army;
					waitUntil {!(isNull _grp)};

					_PMC_opfor = _PMC_opfor + ([_grp] call _countUnits);
				};
				case 1:
				{
					_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Sniper;
					waitUntil {!(isNull _grp)};

					_PMC_opfor = _PMC_opfor + ([_grp] call _countUnits);
				};
				case 2:
				{
					_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Support;
					waitUntil {!(isNull _grp)};

					_PMC_opfor = _PMC_opfor + ([_grp] call _countUnits);
				};
				case 3:
				{
					_grp = [_respawnpoint] call PMC_Create_Takistani_Militia;
					waitUntil {!(isNull _grp)};

					_PMC_opfor = _PMC_opfor + ([_grp] call _countUnits);
				};
				case 4:
				{
					_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Special_Purpose;
					waitUntil {!(isNull _grp)};

					_PMC_opfor = _PMC_opfor + ([_grp] call _countUnits);
				};
			};

			// put group into recycle script
			[_grp] execVM "PMC\PMC_groupRecycle.sqf";

			// add one group created.
			PMC_grp_opfor = PMC_grp_opfor + 1;

			diag_log format["Created new OPFOR group of : %1", (count units _grp)];

			// select target
			_targetpoint = PMC_loc select (random (count PMC_loc));
			// jiggle the fucker as it was array of cooridinates
			pmc_temp_logic setPos _targetpoint;
			pmc_homebase setPos _respawnpoint;

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
			_pos = [9944, 49088, 0];
			_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			pmc_homebase setPos _safePos;
			[_grp, pmc_homebase, pmc_temp_logic] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";
		};
	};

	diag_log format["[(list pmc_opfor_list)] call PMC_countGroups: %1", ([(list pmc_opfor_list)] call PMC_countGroups)];

	sleep _sleeptime;
};

diag_log "War_OPFOR has just exited!";
