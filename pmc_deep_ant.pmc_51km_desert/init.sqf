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
	["PMC_objective1", "Capture city entrance", "You need to capture <marker name='target1'>city entrance</marker> from enemy hands.", true, []],
	["PMC_objective2", "Clean north side", "You need to clean <marker name='target2'>north side</marker> of the city.", true, []],
	["PMC_objective3", "Clear east side", "Clear <marker name='target3'>north side</marker> of the city.", true, []],
	["PMC_objective4", "Clear west side", "Clear <marker name='target4'>west side</marker> of the city.", true, []],
	["PMC_objective5", "Clean rest", "Clean rest of the enemy forces in the city.", true, []]
],[
	["Notes", "This mission was previously known as 'snake cobra attack 6'."],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
