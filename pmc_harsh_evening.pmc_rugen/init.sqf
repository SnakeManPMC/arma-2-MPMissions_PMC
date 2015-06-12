// on server we run...
if (isServer) then
{
	// description.ext mission starting parameters
	skiptime (((paramsarray select 0) - daytime + 24) % 24);

	// set downed helo to gamelogic's random position
	pmc_downed_helo setDir random 360;
	pmc_downed_helo setPos getPosASL pmc_crash_site;
	pmc_downed_helo setFuel 0;
	pmc_downed_helo setDamage 1;

	PMC_crash_site_location = getPosASL pmc_downed_helo;
	publicVariable "PMC_crash_site_location";

	// set debug marker in the downed helo
	// is this global? :)
	"crash_site" setMarkerPos PMC_crash_site_location;
	
	// add the searching insurgent party
	[PMC_crash_site_location] execVM "PMC\PMC_Create_Searching_Insurgents.sqf";
};

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// then exit if on server
//if (isServer) exitWith{};

// eh? try these if the below wont work :)
//waitUntil {!(isNull player)};
//waitUntil {player == player};

// move the crash_team to downed helo
{
	_x setPos [(PMC_crash_site_location select 0) + 20, (PMC_crash_site_location select 1) + 20, 0];
} forEach units crash_team;

[[
	["Find", "Find crashed helo", "Find the downed helo, take survivors into your squad. Aircraft <marker name='crash_site'>crashed</marker>. Search the area for survivors and bring them back to base."],
	["Rescued", "Survivors to base", "Bring back any survivors to base."]
],[
	["Viewdistance", "Setup viewdistance from flag pole."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
