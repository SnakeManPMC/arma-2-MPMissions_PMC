
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// create briefing objectives
	[] execVM "briefing.sqf";
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
		
	player setVariable ["BIS_noCoreConversations", true];
};

enableSaving [ false, false ];
