// on server we run...
if (isServer) then
{
};

[[
	["PMC_objective1", "Kill HVT", "You must find and kill enemy <marker name='markerTask1'>high value target</marker> located somewhere in Zalman downtown.", true, ["markerTask1", getPosASL pmc_1]]
],[
	["Intel", "<marker name='markerTask1'>High Value Target (HVT)</marker> is located inside a building somewhere south west from the Zalman marker. Your target is a Colonel, wearing an Beret and possibly armed only with a handgun.<br/><br/>In the area there is Anti Air threat, possibly several ZU-23 guns, use caution when approaching the area."],
	["Viewdistance", "Change viewdistance from the flag pole."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
