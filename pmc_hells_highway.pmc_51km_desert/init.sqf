// on server we run...
if (isServer) then
{
	// description.ext mission starting parameters
	skiptime (((paramsarray select 0) - daytime + 24) % 24);
};

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

[[
  ["PMC_objective1", "Clear highway WP#1", "You must clear highway <marker name='markerTask1'>waypoint one</marker>.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2", "Clear highway WP#2", "You must clear highway <marker name='markerTask2'>waypoint two</marker>.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3", "Clear highway WP#3", "You must clear highway <marker name='markerTask3'>waypoint three</marker>.", true, ["markerTask3", getPosASL pmc_3]],
  ["PMC_objective4", "Clear highway WP#4", "You must clear highway <marker name='markerTask4'>waypoint four</marker>.", true, ["markerTask4", getPosASL pmc_4]],
  ["PMC_objective5", "Clear Ahanu airbase", "You must clear <marker name='markerTask5'>Ahanu airbase</marker> from any enemy forces.", true, ["markerTask5", getPosASL pmc_5]]
],[
  ["Viewdistance", "Change viewdistance from the flag pole."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
