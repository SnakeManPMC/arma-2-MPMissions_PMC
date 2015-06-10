
private ["_grp","_PMC_blufor","_ran","_targetpoint","_Max_BLUFOR_On_Map","_victoryCondition","_sleeptime","_respawnpoint"];

// maximum number of opfor on the map at one time
_Max_BLUFOR_On_Map = 40;

// how many units to create until ending the loop
_victoryCondition = 500;

// counter for how many units have been created
_PMC_blufor = 0;

// random sleep time for LONG time so we don't have consecutive flights on top of each other
_sleeptime = (60 + random 5);

// hardcoded to airbase 3 for blufor units
_respawnpoint = [1854, 2448, 0];

while {_PMC_blufor < _victoryCondition} do
{
	player sidechat format["evaluating BLUFOR: %1", (count list pmc_blufor_list)];
	if ((count list pmc_blufor_list) < _Max_BLUFOR_On_Map) then
	{
		_ran = floor (random 5);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_respawnpoint] call PMC_Create_US_Army;
				waitUntil {!(isNull _grp)};

				_PMC_blufor = _PMC_blufor + 9;
			};
			case 1:
			{
				_grp = [_respawnpoint] call PMC_Create_US_Army_Sniper;
				waitUntil {!(isNull _grp)};

				_PMC_blufor = _PMC_blufor + 9;
			};
			case 2:
			{
				_grp = [_respawnpoint] call PMC_Create_US_Army_Support;
				waitUntil {!(isNull _grp)};

				_PMC_blufor = _PMC_blufor + 9;
			};
			case 3:
			{
				_grp = [_respawnpoint] call PMC_Create_US_ArmyWeapons;
				waitUntil {!(isNull _grp)};

				_PMC_blufor = _PMC_blufor + 9;
			};
			case 4:
			{
				_grp = [_respawnpoint] call PMC_Create_US_DeltaForce;
				waitUntil {!(isNull _grp)};

				_PMC_blufor = _PMC_blufor + 9;
			};
		};

		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_blufor = PMC_grp_blufor + 1;

		player sideChat format["Created new BLUFOR group of : %1", (count units _grp)];

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
		[_grp, pmc_homebase, pmc_temp_logic] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";
	};

	sleep _sleeptime;
};
