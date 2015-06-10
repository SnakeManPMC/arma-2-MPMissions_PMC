// on server we run...
if (isServer) then
{
	// description.ext mission starting parameters
	skiptime (((paramsarray select 0) - daytime + 24) % 24);
};

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

[[
	["PMC_objective1", "Clear road WP#1", "You must clear road <marker name='markerTask1'>waypoint one</marker> at the intersection.", true, ["markerTask1", getPosASL pmc_1]],
	["PMC_objective2", "Clear Camerig", "You must clear <marker name='markerTask2'>Camerig</marker> town.", true, ["markerTask2", getPosASL pmc_2]],
	["PMC_objective3", "Clear Hoorn", "You must clear <marker name='markerTask3'>Hoorn</marker> town.", true, ["markerTask3", getPosASL pmc_3]],
	["PMC_objective4", "Clear Airfield", "You must clear <marker name='markerTask4'>Airfield</marker>.", true, ["markerTask4", getPosASL pmc_4]],
	["PMC_objective5", "Clear Alverna", "You must clear <marker name='markerTask5'>Alverna</marker> town.", true, ["markerTask5", getPosASL pmc_5]],
	["PMC_objective6", "Clear Airstrip", "You must clear <marker name='markerTask6'>airstrip</marker> from any enemy forces.", true, ["markerTask6", getPosASL pmc_6]]
],[
	["Viewdistance", "Change viewdistance from the flag pole."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
