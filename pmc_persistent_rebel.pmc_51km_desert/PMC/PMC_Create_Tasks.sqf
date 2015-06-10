
// hmm I guess this could be run only on server as shk_taskmaster will broadcast it to clients too, only
// thing client specific in this one is the small radio call that we have achieved objective, which is kind of moot heh.

private
[
	"_z"
];

// create tasks in reverse order :)

// objective 2

if (missionNamespace getVariable "PMC_war_opfor") then
{
	_z = createTrigger ["EmptyDetector", [6400, 6400, 0]];
//	_z setTriggerActivation ["Anybody", "PRESENT", false];
//	_z setTriggerArea [0, 0, 0, true];
//	_z setTriggerTimeout [0, 0, 0, false];
	_z setTriggerStatements ["!PMC_war_opfor", "this = execVM ""PMC\PMC_Obj2.sqf"";", ""];

/* old, we use shk_taskmaster now	
	PMC_objective2 = player createSimpleTask ["Defeat OPFOR"];
	PMC_objective2 setSimpleTaskDescription ["Defeat <marker name='base_tk'>OPFOR</marker>", "Defeat OPFOR", "Defeat OPFOR"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "base_tk");
*/
}
// objective 2 has been completed!
else
{
/*
	PMC_objective2 = player createSimpleTask ["Defeat OPFOR"];
	PMC_objective2 setSimpleTaskDescription ["Defeat <marker name='base_tk'>OPFOR</marker>", "Defeat OPFOR", "Defeat OPFOR"];
	PMC_objective2 setSimpleTaskDestination (getMarkerPos "base_tk");
	PMC_objective2 setTaskState "succeeded";
*/
};


// objective 1

if (missionNamespace getVariable "PMC_war_blufor") then
{
	_z = createTrigger ["EmptyDetector", [6400, 6400, 0]];
//	_z setTriggerActivation ["Anybody", "PRESENT", false];
//	_z setTriggerArea [0, 0, 0, true];
//	_z setTriggerTimeout [0, 0, 0, false];
	_z setTriggerStatements ["!PMC_war_blufor", "this = execVM ""PMC\PMC_Obj1.sqf"";", ""];

/*	
	PMC_objective1 = player createSimpleTask ["Defeat BLUFOR"];
	PMC_objective1 setSimpleTaskDescription ["Defeat <marker name='base_usa'>BLUFOR</marker>", "Defeat BLUFOR", "Defeat BLUFOR"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "base_usa");
*/
}
// objective 1 has been completed!
else
{
/*
	PMC_objective1 = player createSimpleTask ["Defeat BLUFOR"];
	PMC_objective1 setSimpleTaskDescription ["Defeat <marker name='base_usa'>BLUFOR</marker>", "Defeat BLUFOR", "Defeat BLUFOR"];
	PMC_objective1 setSimpleTaskDestination (getMarkerPos "base_usa");
	PMC_objective1 setTaskState "succeeded";
*/
};
