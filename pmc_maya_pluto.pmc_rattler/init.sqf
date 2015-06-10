
if (isServer) then
{
	[PMC_opfor_start] execVM "PMC\PMC_war_opfor.sqf";
};

// create briefing objectives
[] execVM "briefing.sqf";

enableSaving [ false, false ];
