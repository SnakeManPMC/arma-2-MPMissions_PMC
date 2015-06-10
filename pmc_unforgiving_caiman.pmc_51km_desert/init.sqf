// on server we run...
if (isServer) then
{
	// description.ext mission starting parameters
	skiptime (((paramsarray select 0) - daytime + 24) % 24);
	
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];
};

[[
  ["PMC_objective1", "Clear north", "You must clear <marker name='markerTask1'>northern sector</marker>.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2", "Clear downtown", "You must clear <marker name='markerTask2'>downtown area</marker>.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3", "Clear south", "You must clear <marker name='markerTask3'>southern sector</marker>.", true, ["markerTask3", getPosASL pmc_3]]
],[
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
