
private ["_grp","_Max_BLUFOR_On_Map","_respawnpoint","_sleeptime","_victoryCondition"];

// how many blufor to create
_victoryCondition = 50;

// maximum number of opfor on the map at one time
_Max_BLUFOR_On_Map = 20;

// random sleep time
_sleeptime = 120;

// PMC_SelectStartPosit starting position selecting function
call compile preProcessFileLineNumbers "PMC\PMC_SelectStartPosit.sqf";

// PMC_Select_Target
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";

// PMC_Patrol_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";

// PMC_Guard_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";

// PMC_Patrol_Inf_Targets_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Targets_Waypoints.sqf";

// PMC_Create_US_Army
call compile preProcessFileLineNumbers "PMC\PMC_Create_US_Army.sqf";

// wait until mission starts and pmc_opforunits trigger is usable.
waitUntil
{
	(count (list pmc_bluforunits) > 0);
};

while {PMC_blufor < _victoryCondition} do
{
	if ((WEST countSide (list pmc_bluforunits)) < _Max_BLUFOR_On_Map) then
	{
		// random starting location
		_respawnpoint = ["BLUFOR"] call PMC_SelectStartPosit;

		// create 1st squad of BLUFOR
		_grp = [_respawnpoint] call PMC_Create_US_Army;

		// add one group created.
		PMC_grp_blufor = PMC_grp_blufor + 1;
		publicVariable "PMC_grp_blufor";

		// select target
		//_targetpoint = call PMC_Select_Target;

[_grp, 100] call PMC_Patrol_Inf_Targets_Waypoints;
/*
		_ran = floor (random 2);
		switch (_ran) do
		{
			case 0:
		    	{
				// PMC_Patrol_Inf_Waypoints
				[_grp, _targetpoint, 100] call PMC_Patrol_Inf_Waypoints;
		    	};
			case 1:
			{
				// PMC_Guard_Inf_Waypoints
				[_grp, _targetpoint, 0] call PMC_Guard_Inf_Waypoints;
			};
		};
*/
		// add our created enemies with 9
		PMC_blufor = PMC_blufor + 12;
		publicVariable "PMC_blufor";
	};
	sleep _sleeptime;
};
