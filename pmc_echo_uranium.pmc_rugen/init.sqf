// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1", "Clear Obj1", "You must clear the <marker name='markerTask1'>Obj1</marker>.", true, ["markerTask1", getPosASL pmc_1]],
  ["PMC_objective2", "Clear Obj2", "You must clear the <marker name='markerTask2'>Obj2</marker>.", true, ["markerTask2", getPosASL pmc_2]],
  ["PMC_objective3", "Clear Obj3", "You must clear the <marker name='markerTask3'>Obj3</marker>.", true, ["markerTask3", getPosASL pmc_3]]
],[
  ["Credits","Mission by PMC"]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
