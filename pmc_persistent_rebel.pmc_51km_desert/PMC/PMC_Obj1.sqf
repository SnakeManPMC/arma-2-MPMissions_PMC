
player sideChat "HOOYAH! We have defeated BLUFOR!";

//PMC_objective1 setTaskState "succeeded";

["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;

PMC_objective1_done = true;
publicVariable "PMC_objective1_done";

// nice hint of it
//[objNull, ObjNull, pmc_objective1, "SUCCEEDED"] execVM "CA\Modules\MP\data\scriptCommands\taskHint.sqf";

// debug for log ;)
diag_log format["#### Objective 1 completed! time: %1", time];
