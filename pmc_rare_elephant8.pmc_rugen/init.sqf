[[
  ["task1","Objective 1","Clear <marker name='target1'>objective 1</marker>"],
  ["task2","Objective 2","Clear <marker name='target2'>objective 2</marker>"],
  ["task3","Objective 3","Clear <marker name='target3'>objective 3</marker>"],
  ["task4","Objective 4","Clear <marker name='target4'>objective 4</marker>"]
],[
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
