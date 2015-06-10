// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1", "Clear Obj1", "You must clear the <marker name='markerTask1'>Obj1</marker>.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2", "Clear Obj2", "You must clear the <marker name='markerTask2'>Obj2</marker>.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3", "Clear Obj3", "You must clear the <marker name='markerTask3'>Obj3</marker>.", true, ["markerTask3", getPosASL pmc_3]],
  ["PMC_objective4", "Clear Obj4", "You must clear the <marker name='markerTask4'>Obj4</marker>.", true, ["markerTask4", getPosASL pmc_4]],
  ["PMC_objective5", "Clear Obj5", "You must clear the <marker name='markerTask5'>Obj5</marker>.", true, ["markerTask5", getPosASL pmc_5]]
],[
  ["Viewdistance", "Change viewdistance from the flag pole."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
