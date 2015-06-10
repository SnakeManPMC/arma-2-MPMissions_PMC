PMC_war_is_on = true;
pmc_mcomplete = false;

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

// corpse deletion with set limit
PMC_corpses = [];
[150] execVM "PMC\PMC_corpses.sqf";

// bit debug here :)
PMC_killedNum = 0;
publicVariable "PMC_killedNum";

call compile preProcessFileLineNumbers "PMC\PMC_Create_BLUFOR_Guard.sqf";
call compile preProcessFileLineNumbers "PMC\PMC_Create_OPFOR_Guard.sqf";

sleep 1;

while {PMC_war_is_on} do
{
	if ((WEST countSide (list pmc_list)) < 100) then
	{
		call PMC_MakeGuardInfBLUFOR;
	};
	sleep 60;
	if ((EAST countSide (list pmc_list)) < 100) then
	{
		call PMC_MakeGuardInfOPFOR;
	};
};
