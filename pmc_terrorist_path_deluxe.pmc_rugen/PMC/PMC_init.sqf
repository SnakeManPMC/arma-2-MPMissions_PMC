
// client
if (!isServer) exitWith
{
	// create briefing
	[] execVM "briefing.sqf";
	// use the other guys weather for testing
	//[] execVM "PMC\PMC_weather.sqf";

	waitUntil
	{
		sleep 0.3;
		(count (missionNamespace getVariable "PMC_initial_lists") > 0);
	};

	call compile preProcessFileLineNumbers "PMC\PMC_Time_Used.sqf";
	//[] execVM "PMC\PMC_Count_All_Units.sqf";

	// here is where our war starts
	// check if either side has detected each other, then proceed.
	waitUntil
	{
		sleep 2;
		((PMC_blufor_detected > 0) || (PMC_opfor_detected > 0) );
	};
	
	titleText ["Our War has begin, congratulations bitch!", "plain down", 2];
};
// and we exited, server continues the rest ...

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// debug on
PMC_debug = true;
publicVariable "PMC_debug";

// how many times difference sides detected enemies in their territory.
PMC_blufor_detected = 0;
PMC_opfor_detected = 0;
publicVariable "PMC_blufor_detected";
publicVariable "PMC_opfor_detected";

waitUntil
{
	(count list pmc_opfor_list > 0);
};

PMC_initial_lists =
[
	count list pmc_opfor_list,
	west countSide list pmc_opfor_list,
	east countSide list pmc_opfor_list,
	('tank' countType list pmc_opfor_list),
	('car' countType list pmc_opfor_list),
	('air' countType list pmc_opfor_list),
	('man' countType list pmc_opfor_list)
];
publicVariable "PMC_initial_lists";

// number of created groups
PMC_grpNum = 0;
publicVariable "PMC_grpNum";

// initialized variables and settings
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

// corpse removal script
PMC_corpses = [];
publicVariable "PMC_corpses";
[150] execVM "PMC\PMC_corpses.sqf";

// add killed script to each of the mission editor placed units
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach list pmc_opfor_list;
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach list pmc_blufor_list;

// count for opfor
PMC_opfor = 0;

// count for blufor
PMC_blufor = 0;

// PMC_Select_Target
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";

// PMC_Patrol_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Patrol_Inf_Waypoints.sqf";

// PMC_Guard_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Guard_Inf_Waypoints.sqf";

// PMC_Sentry_Inf_Waypoints
call compile preProcessFileLineNumbers "PMC\PMC_Sentry_Inf_Waypoints.sqf";

// insert all locations into an array
PMC_Locations = [];
PMC_Locations = call compile preprocessFileLineNumbers "PMC\PMC_locationFinder.sqf";
publicVariable "PMC_Locations";

// create some triggers
[] execVM "PMC\Create_Triggers.sqf";

/*
doesn't feel right in this mission even though the initial mission editor placed things make the mission annoying when
restarting over and over again, everytime the same...
*/
//player setPos (PMC_Locations select random (count PMC_Locations));

// here is where our war starts
// check if either side has detected each other, then proceed.
waitUntil
{
	sleep 2;
	((PMC_blufor_detected > 0) || (PMC_opfor_detected > 0) );
};

[] execVM "PMC\PMC_war_blufor.sqf";
// blufor_airlift_start
// opfor_airlift_start
// blufor_land_start
// opfor_land_start

[] execVM "PMC\PMC_war_opfor.sqf";

// crazy tank thing :)
// disabled for debugging. we use soft_vehicles script now.
//[] execVM "PMC\PMC_Create_Tank_Platoon_OPFOR_T72.sqf";

// delay so we dont stack
//sleep 60;

// crazy car "vehicle" thing :)
[] execVM "PMC\PMC_Create_Soft_Vehicles.sqf";

// helicopter patrols
[] execVM "PMC\PMC_Helo_Chernarus_BLUFOR.sqf";
[] execVM "PMC\PMC_Helo_Chernarus_OPFOR.sqf";
