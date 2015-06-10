// experimental FOB creation from addaction
player addAction ["Create FOB (Read briefing!)", "PMC\PMC_Choose_FOB_Location.sqf", true];
// experimental strike team insert from addaction
player addAction ["Call Strike Team", "PMC\PMC_Strike_Team.sqf", true];
// airstrike
player addAction ["Call Airstrike", "PMC\PMC_Airstrike_Call.sqf", true];
hintSilent "Create FOB action, added. Please read briefing for help, please do not abuse this.\n\nCall Strike Team action added.";
