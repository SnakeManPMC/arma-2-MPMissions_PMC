
[] execVM "PMC\PMC_addPublicEventHandlers.sqf";

// run for everybody
// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// create briefing objectives
//[] execVM "PMC\PMC_briefing.sqf";
[[
	["PMC_objective1", "Defeat BLUFOR", "Defeat <marker name='base_usa'>US forces</marker> (BLUFOR).", true, []],
	["PMC_objective2", "Defeat OPFOR", "Defeat <marker name='base_tk'>Takistani forces</marker> (OPFOR).", true, []]
],[
	["Situation", "US base is at the <marker name='base_usa'>southern airport</marker>, Takistani Army base is on the <marker name='base_tk'>northern airport</marker>.<br/><br/><marker name='start'>Guerrilla base</marker> is located in between.<br/><br/>US Army and Takistani Army are fighting each other in territories of Takistan. Local guerrillas are fighting against both of them."],
	["Mission", "You are Takistani local guerrilla fighting against both the US and Takistani Armies. Use any means necessary to kill, maim and destroy all and every enemy soldier and vehicle you encounter. Our motherland depends on you, our brave soldiers of the people of Takistan."],
	["Tactical", "You need to scavenge weapons / ammo and vehicles 'loot' from the dead soldiers on the battlefield. Use these scavenged weapons and vehicles wisely, don't waste them.<br/>Remember that enemy aircrafts easily attack the vehicle you are driving and if destroyed all your loot in the cargo will be lost.<br/><br/>Respawn Vehicles at base<br/>The vehicles in your base respawn so be careful when abandoning them with loot in the cargo (abandoned vehicle respawns in THREE (3) hours time), ALL LOOT IS LOST WHEN YOUR BASE-VEHICLES RESPAWN.<br/><br/>Make sure you have night vision equipment for those moonless nights."],
	["Environment", "Date is July 28th, 2010. Sunrise is from east at 0515hrs (you can see without night vision already at 0400hrs), sunset is 1900hrs (you need night vision at 2030hrs)."]
]] call compile preprocessfilelinenumbers "PMC\shk_taskmaster.sqf";

// on server we run...
if (isServer) then
{
	// PMC server stuff
	[] execVM "PMC\PMC_init.sqf";

	// weather script
	//[] execVM "PMC\PMC_weather.sqf";
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

	// hmm isn't this obsolete? 9/Jul/2014 8:33
	PMC_unitMarker = 0;
	publicVariable "PMC_unitMarker";
}
else
{
	// screen is black at start
	cutText ["", "BLACK FADED", 9999];
	
	// eh? try these if the below wont work :)
	// again, isn't this obsolete as this for the old briefing.sqf method but not needed with shk_taskmaster?
	waitUntil {!(isNull player)};
	waitUntil {player == player};
	
	// triggers for client
	[] execVM "PMC\Triggers.sqf";

	// this is gay, its like a debug joke really?
	//player addAction ["Camera", "camerago.sqf", true];
	
	// debug for clients, remember to remove for release version :)
	// disabled for v1.63 undefined variable expression errors
	//[] execVM "PMC\PMC_debug.sqf";
	
	// create client objectives
	[] execVM "PMC\PMC_Create_Tasks.sqf";
	
	// weather script
	//[] execVM "PMC\PMC_weather.sqf";
	[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";
	
	player setVariable ["BIS_noCoreConversations", true];

	waitUntil { !isnil "bis_fnc_init" };
	
	// add nice text
	cutText ["", "BLACK IN", 2];
	sleep 10;
	["PMC Persistent Rebel", "PMC 51km Desert", "07-28-10"] spawn BIS_fnc_infoText;
	
	// Huge debug shieet ;)
	//player setPos [(getPosASL pmc_blufor_start_1 select 0),(getPosASL pmc_blufor_start_1 select 1) + 200];
};

enableSaving [ false, false ];
