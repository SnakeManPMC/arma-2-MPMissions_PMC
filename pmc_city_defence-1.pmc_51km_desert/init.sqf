
if (isServer) then
{
	[] execVM "PMC_war.sqf";
};

[] execVM "briefing.sqf";

enableSaving [ false, false ];
