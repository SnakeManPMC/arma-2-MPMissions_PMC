
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	[] execVM "PMC\PMC_init_client.sqf";
};

// setup briefing
[[
	["PMC_objective1","Kill em all","Kill em all", true, []]
],[
	["Mission Tips","Setup view distance from your base's flag pole."],
	["Environment", "Date is June 15th, 2010. Sunrise is from east at 0640hrs, sunset is 1705hrs."],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
