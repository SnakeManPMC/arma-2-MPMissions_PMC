// on server we run...
if (isServer) then
{
	// set downed helo to gamelogic's random position
	pmc_downed_helo setDir random 360;
	pmc_downed_helo setPos getPosASL pmc_crash_site;

	PMC_crash_site_location = getPosASL pmc_downed_helo;
	publicVariable "PMC_crash_site_location";

	// set debug marker in the downed helo. this is global command.
	"crash_site" setMarkerPos PMC_crash_site_location;
	
	// add the searching insurgent party
	[PMC_crash_site_location] execVM "PMC\PMC_Create_Searching_Insurgents.sqf";
};

[[
	["Find", "Find crashed helo", "Find the downed helo, take survivors into your squad."],
	["Rescued", "Survivors to base", "Bring back any survivors to <marker name='start'>US base</marker>, alive."]
],[
	["Viewdistance", "Change viewdistance from the flag pole."],
	["Mission", "Aircraft <marker name='crash_site'>crashed</marker>. Search the area for survivors and bring them back to base."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
diag_log format["Going into init.sqf waituntil! PMC_crash_site_location: %1", PMC_crash_site_location];
player sideChat format["Going into init.sqf waituntil! PMC_crash_site_location: %1", PMC_crash_site_location];
	
// wait until we have the crash site variable from server
waitUntil
{
	(!isNil "PMC_crash_site_location");
};
	
diag_log format["Returned from waituntil! PMC_crash_site_location: %1", PMC_crash_site_location];
player sideChat format["Returned from waituntil! PMC_crash_site_location: %1", PMC_crash_site_location];

diag_log format["%1", units crash_team];
player sideChat format["%1", units crash_team];
*/

/*
for some unknown reason when this code works OK in chernarus, it doesnt in PMC 51km Desert. The only way
it works is to add that stupid sleep delay at mission start.
*/
sleep 0.5;

// move the crash_team to downed helo
{
	_x setPos [(PMC_crash_site_location select 0) + 20, (PMC_crash_site_location select 1) + 20, 0];
//	diag_log format["_x pos is: %1", getPosASL _x];
//	player sideChat format["_x pos is: %1", getPosASL _x];
} forEach units crash_team;
	
//diag_log format["Executed setPos for crash_team. position is %1 and isServer: %2", PMC_crash_site_location, isServer];
//player sideChat format["Executed setPos for crash_team. position is %1 and isServer: %2", PMC_crash_site_location, isServer];
