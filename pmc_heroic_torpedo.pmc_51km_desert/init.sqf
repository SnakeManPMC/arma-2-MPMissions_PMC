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
	["PMC_objective1", "Main City", "<marker name='target1'>Main City</marker>", true, []],
	["PMC_objective2", "District A", "<marker name='target2'>District A</marker>", true, []],
	["PMC_objective3", "Minaret 2", "<marker name='target3'>Minaret 2</marker>", true, []],
	["PMC_objective4", "Minaret 1", "<marker name='target4'>Minaret 1</marker>", true, []]
],[
	["Gen. Sitrep", "This city is essential in our war effort, it must be seized on todays operation before we can continue forward. Beware of the mosques."],
	["Orders", "1-1-A team <marker name='start'>start</marker> from city edge. Assault and capture <marker name='target1'>main city</marker> objective. Beware of the mosques. Additionally you must clear <marker name='target2'>District A</marker>. Check <marker name='target3'>Minaret 2</marker> and <marker name='target4'>Minaret 1</marker> carefully. Do not damage the mosques.<br/><br/>Clear the city of enemy activity."],
	["Support", "Your support today is AH-1 Cobra gunship, two armed hummers and two infantry squads."],
	["Diary", "Clearing is cool."],
	["Notes", "this mission had UPS.sqf to move the civilians as ambience, however in the v1.62.10xxxx beta patch bis removed the evil set-vehicle-init command so the script didn't work anymore. So, dunno how this mission works now? :)"],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
