// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

player setVariable ["BIS_noCoreConversations", true];

// wait until server gives us HQ location
waitUntil { !isNil "PMC_HQ"; };

player setPos PMC_HQ;

// wait until server gives us DATA
waitUntil { !isNil "PMC_MissionObjectives"; };

// this was previously in PMC_init, is it synchronized properly?
// objective tasks
[PMC_MissionObjectives] execVM "PMC\PMC_tasks.sqf";
