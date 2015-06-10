
player sideChat "HOOYAH! We have defeated OPFOR!";

//PMC_objective2 setTaskState "succeeded";
["PMC_objective2", "succeeded"] call SHK_Taskmaster_Upd;

PMC_objective2_done = true;
publicVariable "PMC_objective2_done";

// nice hint of it
//[objNull, ObjNull, pmc_objective2, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";

// debug for log ;)
diag_log format["#### Objective 2 completed! time: %1", time];
