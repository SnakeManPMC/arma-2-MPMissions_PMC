
private
[
	"_grp",
	"_ran",
	"_Max_OPFOR_On_Map",
	"_respawnpoint",
	"_sleeptime",
	"_targetpoint",
	"_victoryCondition"
];

// maximum number of opfor on the map at one time
_Max_OPFOR_On_Map = 25;

// random sleep time
// debug long that we don't have many helos ferrying soldiers which then "explode" the unit numbers when disembarked.
_sleeptime = (360 + random 360);

call compile preProcessFileLineNumbers "PMC\PMC_Create_Russian_Infantry_Squad.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Russian_Infantry_Section.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Russian_Infantry_Section_AA.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Russian_Infantry_Section_AT.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Russian_Infantry_Section_MG.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_Russian_Infantry_Sniper_Team.sqf";

while {true} do
{
	if (count (list pmc_opfor_list) < _Max_OPFOR_On_Map) then
	{
		// random starting location
		//_respawnpoint = ["OPFOR"] call PMC_SelectStartPosit;
		_respawnpoint = opfor_airlift_start;

		_ran = floor (random 6);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_respawnpoint] call PMC_Create_Russian_Infantry_Squad;
				waitUntil {!(isNull _grp)};

				PMC_opfor = PMC_opfor + 10;
				publicVariable "PMC_opfor";
			};
			case 1:
			{
				_grp = [_respawnpoint] call PMC_Create_Russian_Infantry_Section;
				waitUntil {!(isNull _grp)};

				PMC_opfor = PMC_opfor + 10;
				publicVariable "PMC_opfor";
			};
			case 2:
			{
				_grp = [_respawnpoint] call PMC_Create_Russian_Infantry_Section_AA;
				waitUntil {!(isNull _grp)};

				PMC_opfor = PMC_opfor + 10;
				publicVariable "PMC_opfor";
			};
			case 3:
			{
				_grp = [_respawnpoint] call PMC_Create_Russian_Infantry_Section_AT;
				waitUntil {!(isNull _grp)};

				PMC_opfor = PMC_opfor + 10;
				publicVariable "PMC_opfor";
			};
			case 4:
			{
				_grp = [_respawnpoint] call PMC_Create_Russian_Infantry_Section_MG;
				waitUntil {!(isNull _grp)};

				PMC_opfor = PMC_opfor + 10;
				publicVariable "PMC_opfor";
			};
			case 5:
			{
				_grp = [_respawnpoint] call PMC_Create_Russian_Infantry_Sniper_Team;
				waitUntil {!(isNull _grp)};

				PMC_opfor = PMC_opfor + 10;
				publicVariable "PMC_opfor";
			};
		};

		// put group into recycle script
		[_grp] execVM "PMC\PMC_groupRecycle.sqf";

		// add one group created.
		PMC_grp_opfor = PMC_grp_opfor + 1;
		publicVariable "PMC_grp_opfor";

		// select target
		//_targetpoint = call PMC_Select_Target;
		PMC_temporary_location setPos (PMC_Locations select (random count PMC_Locations));
		_targetpoint = PMC_temporary_location;

		// ferry them into target area
		[_grp, _respawnpoint, _targetpoint] execVM "PMC\PMC_Infantry_Transport_Airborne_Russian.sqf";

		// debug
		hintSilent "Russian Reinforcements Arrive!";
		player sideChat "Russian Reinforcements Arrive!";

		_ran = floor (random 3);
		// guard rules :)
		//_ran = 1;
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
			case 2:
			{
				// PMC_Sentry_Inf_Waypoints
				[_grp, _targetpoint, 100] call PMC_Sentry_Inf_Waypoints;
			};
		};
	};

	sleep _sleeptime;
};
