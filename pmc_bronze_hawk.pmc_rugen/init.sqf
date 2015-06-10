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
	["PMC_objective1", "Clear Killbox 1", "You must clear <marker name='killbox1'>killbox 1</marker> area."],
	["PMC_objective2", "Clear Killbox 2", "You must clear <marker name='killbox2'>killbox 2</marker> area."],
	["PMC_objective3", "Clear Killbox 3", "You must clear <marker name='killbox3'>killbox 3</marker> area."],
	["PMC_objective4", "Clear Killbox 4", "You must clear <marker name='killbox4'>killbox 4</marker> area."],
	["PMC_objective5", "Clear Killbox 5", "You must clear <marker name='killbox5'>killbox 5</marker> area."],
	["PMC_objective6", "Clear Killbox 6", "You must clear <marker name='killbox6'>killbox 6</marker> area."],
	["PMC_objective7", "Clear Killbox 7", "You must clear <marker name='killbox7'>killbox 7</marker> area."],
	["PMC_objective8", "Clear Killbox 8", "You must clear <marker name='killbox8'>killbox 8</marker> area."],
	["PMC_objective9", "Clear Killbox 9", "You must clear <marker name='killbox9'>killbox 9</marker> area."]
],[
	["Intel", "Unkown number of enemy vehicles are operating in the region. Be prepared for anti air euipment, heavy armor as well as soft vehicles."],
	["Credits", "Addons used:<br/>PMC Rugen (25km terrain) by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

for opfor dead trigger add:
["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

*/
