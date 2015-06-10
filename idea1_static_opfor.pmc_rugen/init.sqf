// if on server
if (isServer) then
{
	[] execVM "PMC\PMC_init.sqf";
}
else
{
	// set our weather using multiplayer parameter array
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];
	
	// if first FOB is in place already
	if (!isNil PMC_active_fob) then
	{
		player setPos PMC_active_fob;
		"respawn_west" setMarkerPosLocal PMC_active_fob;
	};
};

// setup briefing
[[
	["PMC_fob1", "Open FOB 1", "<marker name='fob_1'>Open FOB 1</marker>", true, []],
	["PMC_fob2", "Open FOB 2", "<marker name='fob_2'>Open FOB 2</marker>", true, []],
	["PMC_fob3", "Open FOB 3", "<marker name='fob_3'>Open FOB 3</marker>", true, []],
	["PMC_fob4", "Open FOB 4", "<marker name='fob_4'>Open FOB 4</marker>", true, []],
	["PMC_fob5", "Open FOB 5", "<marker name='fob_5'>Open FOB 5</marker>", true, []],
	["PMC_fob6", "Open FOB 6", "<marker name='fob_6'>Open FOB 6</marker>", true, []]
],[
	["Credits", "Addons used:<br/>PMC Rugen by PMC.<br/>AGS Industrial by AGS/PMC.<br/>AGS Harbor / Port by AGS/PMC.<br/>Mission design, scripts: Snake Man, PMC."]
]] call compile preprocessFileLineNumbers "PMC\shk_taskmaster.sqf";

enableSaving [ false, false ];

/*
	reference

PMC_active_fob == Position of current fob, so on mission join do;

player setPos PMC_active_fob;
"respawn_west" setMarkerPosLocal PMC_active_fob;

*/
