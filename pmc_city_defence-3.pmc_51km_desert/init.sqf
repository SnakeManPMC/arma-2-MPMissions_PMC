
if (isServer) then
{
	// initialized variables and settings
	PMC_killedNum = 0;
	publicVariable "PMC_killedNum";
	
	// corpse removal script
	PMC_corpses = [];
	[50] execVM "PMC\PMC_corpses.sqf";
	
	// start the war
	// opfor infantry
	[] execVM "PMC\PMC_war_OPFOR.sqf";
	// opfor vehicles
	[] execVM "PMC\PMC_OPFOR_Vehicles.sqf";
	// blufor infantry
	[] execVM "PMC\PMC_war_BLUFOR.sqf";
	// blufor vehicles
	[] execVM "PMC\PMC_BLUFOR_Vehicles.sqf";
}
else
{
	[] execVM "PMC\briefing.sqf";
};

enableSaving [ false, false ];
