
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
	["PMC_objective1","Kill VIP 1","Kill VIP 1.", true, []],
	["PMC_objective2","Kill VIP 2","Kill VIP 2.", true, []],
	["PMC_objective3","Kill VIP 3","Kill VIP 3.", true, []],
	["PMC_objective4","Kill VIP 4","Kill VIP 4.", true, []],
	["PMC_objective5","Kill VIP 5","Kill VIP 5.", true, []],
	["PMC_objective6","Destroy SCUDs 1","Destroy SCUDs 1.", true, []],
	["PMC_objective7","Destroy SCUDs 2","Destroy SCUDs 2.", true, []],
	["PMC_objective8","Destroy SCUDs 3","Destroy SCUDs 3.", true, []],
	["PMC_objective9","Destroy SCUDs 4","Destroy SCUDs 4.", true, []],
	["PMC_objective10","Destroy SCUDs 5","Destroy SCUDs 5.", true, []]
],[
	["Mission Tips","Setup view distance from your base's flag pole.<br/><br/>Vehicles respawn time is 1 hour for abandoned or destroyed.<br/><br/>Use Action Menu to setup Forward Operating Base (FOB) where you are located. Please use it wisely.<br/><br/>JIP players start at US base, when they respawn they do it in the latest FOB (marked on map)."],
	["Environment", "Date is June 15th, 2010. Sunrise is from east at 0640hrs, sunset is 1705hrs."],
	["Credits", "Addons used:<br/>PMC 51km Desert by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];
