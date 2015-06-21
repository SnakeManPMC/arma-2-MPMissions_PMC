if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	[] execVM "PMC\PMC_init_client.sqf";
};

[[
	["PMC_objective1", "Clear all killboxes", "Clear all enemies from each of the <marker name='killbox1'>killboxes</marker> areas (5km x 5km). Notice that there are several killboxes."]
],[
	["Mission", "When you clear an killbox you'll be notified using radio, at this time a Forward Area Refuelling Point (FARP) is placed (check map for a marker) where you'll find repair, rearm and refuel trucks. You need to clear all killboxes for any enemy activity to accomplish your mission.<br/><br/>Killboxes 9, 10 and 11 on the far east side of the terrain do not have FARP support."],
	["Viewdistance", "Change viewdistance from the flag pole."],
	["Credits", "Mission by Snake Man, PMC. This was originally a single player mission called PMC Apache Realwar."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

// debug
PMC_debug = true;

enableSaving [ false, false ];
