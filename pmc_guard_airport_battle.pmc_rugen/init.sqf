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
	["PMC_objective1", "Survive", "Your <marker name='respawn_guer'>guerrilla base</marker> is located in the oil refinery (nice place huh). Survive the battle between <marker name='opfor'>Russians</marker> and <marker name='blufor'>USMC</marker> troops."]
],[
	["Mission", "You are guerrilla bastard fighting for your country against both the Russians and USMC troops. Kill them all!"],
	["Credits", "Addons used:<br/>PMC Rugen by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

for opfor dead trigger add:
["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

*/
