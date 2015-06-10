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
	["PMC_objective1", "Clear Halil", "Clear city of <marker name='target1'>Halil</marker> of all enemy presence.", true, []]
],[
	["Gen. Sitrep", "This city is essential in our war effort, it must be seized on todays operation before we can continue forward."],
	["Orders", "1-1-A team <marker name='start'>start</marker> from city. Assault and capture <marker name='target1'>city</marker> objective.<br/><br/>Clear the city of enemy activity.<br/><br/>1-1-A team <marker name='start'>start</marker> from city. Assault and capture <marker name='target1'>city</marker> objective. Let nobody escape the city."],
	["Support", "Your support today is AH-1 Cobra gunships, two armed hummers and two infantry squads."],
	["Diary", "Clearing is cool. This mission was previously known as 'snake cityhunt 3'."],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
