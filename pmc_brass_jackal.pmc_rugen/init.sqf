// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];
};

// setup briefing
[[
	["PMC_objective1", "Clear Tubbergen", "You must clear <marker name='markerTask1'>Tubbergen</marker> town.", true, ["markerTask1", getPosASL pmc_1]],
	["PMC_objective2", "Clear Hoorn", "You must clear <marker name='markerTask2'>Hoor</marker> town.", true, ["markerTask2", getPosASL pmc_2]],
	["PMC_objective3", "Clear Camerig", "You must clear <marker name='markerTask3'>Camerig</marker>.", true, ["markerTask3", getPosASL pmc_3]]
],[
	["Credits", "Addons used:<br/>PMC Rugen by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

for opfor dead trigger add:
["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

*/
