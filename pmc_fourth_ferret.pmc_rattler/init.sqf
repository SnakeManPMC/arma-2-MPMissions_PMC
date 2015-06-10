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
	["PMC_objective1", "Clear Obj1", "You must clear the <marker name='markerTask1'>Obj1</marker>.", true, ["markerTask1", getPosASL pmc_1]],
	["PMC_objective2", "Clear Obj2", "You must clear the <marker name='markerTask2'>Obj1</marker>.", true, ["markerTask2", getPosASL pmc_2]],
	["PMC_objective3", "Clear Obj3", "You must clear the <marker name='markerTask3'>Obj1</marker>.", true, ["markerTask3", getPosASL pmc_3]]
],[
	["Credits", "Addons used:<br/>PMC Rattler by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

for opfor dead trigger add:
["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

*/
