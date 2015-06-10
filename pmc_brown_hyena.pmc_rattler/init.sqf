// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1","Clear north end","You must clear the <marker name='markerTask1'>north end</marker> of enemy FARP.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2","Clear center","You must clear the <marker name='markerTask2'>center</marker> of enemy FARP.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3","Clear south end","You must clear the <marker name='markerTask3'>south end</marker> of enemy FARP.", true, ["markerTask3", getPosASL pmc_3]]
],[
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

enableSaving [ false, false ];
