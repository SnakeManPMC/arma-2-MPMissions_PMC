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
	["PMC_objective0", "Clear Shadee", "<marker name='target'>Shadee</marker>", true, []],
	["PMC_objective1", "Clear Marnin", "<marker name='target_1'>Marnin</marker>", true, []],
	["PMC_objective2", "Clear Makis", "<marker name='target_2'>Makis</marker>", true, []],
	["PMC_objective3", "Clear Tamar", "<marker name='target_3'>Tamar</marker>", true, []],
	["PMC_objective4", "Clear Waseem", "<marker name='target_4'>Waseem</marker>", true, []],
	["PMC_objective5", "Clear Qadir", "<marker name='target_5'>Qadir</marker>", true, []],
	["PMC_objective6", "Clear Duman", "<marker name='target_6'>Duman</marker>", true, []],
	["PMC_objective7", "Clear Zephan", "<marker name='target_7'>Zephan</marker>", true, []],
	["PMC_objective8", "Clear Akmal", "<marker name='target_8'>Akmal</marker>", true, []],
	["PMC_objective9", "Clear Rafi", "<marker name='target_9'>Rafi</marker>", true, []]

],[
	["Notes", "This mission was previously known as 'snake cobra attack 4'."],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
