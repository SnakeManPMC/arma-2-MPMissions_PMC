// if on server
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
],[
	["Credits", "Addons used:<br/>PMC Rugen by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
