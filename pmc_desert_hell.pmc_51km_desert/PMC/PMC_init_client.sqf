// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// FARP marker creation on clients
call compile preProcessFileLineNumbers "PMC\PMC_Create_FARP_Marker.sqf";

player setVariable ["BIS_noCoreConversations", true];
