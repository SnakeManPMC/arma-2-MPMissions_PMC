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
	["PMC_objective2", "Clear Obj2", "You must clear the <marker name='markerTask2'>Obj2</marker>.", true, ["markerTask2", getPosASL pmc_2]],
	["PMC_objective3", "Clear Obj3", "You must clear the <marker name='markerTask3'>Obj3</marker>.", true, ["markerTask3", getPosASL pmc_3]],
	["PMC_objective4", "Clear Obj4", "You must clear the <marker name='markerTask4'>Obj4</marker>.", true, ["markerTask4", getPosASL pmc_4]],
	["PMC_objective5", "Clear Obj5", "You must clear the <marker name='markerTask5'>Obj5</marker>.", true, ["markerTask5", getPosASL pmc_5]],
	["PMC_objective6", "Clear Obj6", "You must clear the <marker name='markerTask6'>Obj6</marker>.", true, ["markerTask6", getPosASL pmc_6]],
	["PMC_truckobj", "Get truck to port", "You must escort a special truck from <marker name='airstrip'>airstrip</marker> into <marker name='port'>south west port</marker>."]
],[
	["Mission", "One of your men need to be flown into the <marker name='airstrip'>airstrip</marker> where he boards the special ammunition truck and drives it safely to <marker name='port'>south west port</marker>. If the truck is destroyed your mission fails."],
	["Credits", "Addons used:<br/>PMC Rugen by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

for opfor dead trigger add:
["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

*/
