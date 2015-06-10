// on server we run...
if (isServer) then
{
};

[[
  ["PMC_objective1", "Clear Killbox 1", "You must clear the <marker name='killbox1'>Killbox 1</marker>."],
  ["PMC_objective2", "Clear Killbox 2", "You must clear the <marker name='killbox2'>Killbox 2</marker>."],
  ["PMC_objective3", "Clear Killbox 3", "You must clear the <marker name='killbox3'>Killbox 3</marker>."],
  ["PMC_objective4", "Clear Killbox 4", "You must clear the <marker name='killbox4'>Killbox 4</marker>."],
  ["PMC_objective5", "Clear Killbox 5", "You must clear the <marker name='killbox5'>Killbox 5</marker>."],
  ["PMC_objective6", "Clear Killbox 6", "You must clear the <marker name='killbox6'>Killbox 6</marker>."]
],[
  ["Viewdistance", "Change viewdistance from the flag pole."],
	["Credits", "Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";

player setVariable ["BIS_noCoreConversations", true];

enableSaving [ false, false ];
