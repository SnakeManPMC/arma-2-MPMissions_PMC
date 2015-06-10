// run on server
if (isServer) then
{
	[] execVM "CreateSides.sqf";
	[] execVM "CreateTriggers.sqf";
	
        PMC_debug = false;
	// corpse removal script
	PMC_corpses = [];
	PMC_killedNum = 0;
	[100] execVM "PMC_corpses.sqf";
	
	// target & starting locations for hutus
	[] execVM "PMC_targets.sqf";
	
	call compile preprocessFileLineNumbers "PMC_Select_Target.sqf";
	
	waitUntil { !isnil "bis_fnc_init" };
	
	[] execVM "StressTest_OPFOR.sqf";
	[] execVM "StressTest_BLUFOR.sqf";
};

[[
	["PMC_objective1","Reach Target Building","You must reach target building.", true, ["markerTask1", getPosASL targetbuilding]],
	["PMC_objective2","Reach Pakistani Stadium","You must reach Pakistani stadium.", true, ["markerTask2", getPosASL pakistanistadium]],
	["PMC_objective3","Return to base","From target building, return to base.", true, ["markerTask3", getPosASL base]]
	],[
	["Credits","Mission by Snake Man, PMC."]
]] call compile preprocessfilelinenumbers "shk_taskmaster.sqf";
