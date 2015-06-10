// weather disabled, its raining like all the time, what the fuck?
//[] execVM "PMC\PMC_weather.sqf";

// remove all weapons from new player
removeAllWeapons player;

// add killed eventhandler to remove dead player bodies
// respawn script to remove weapon from respawned player
player addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"; handle = _this execVM "PMC\PMC_respawnPlayer.sqf"}];

// DEBUG HAHAHAHA
[player] execVM "PMC\PMC_viewdistance_flagpole.sqf";
// binocular never hurt nobody
player addWeapon "binocular";
// nvg's so he can see at night hehe
player addWeapon "nvgoggles";
// pistol so he can defend himself
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addMagazine "8Rnd_9x18_Makarov";
player addWeapon "makarov";

player addAction ["Set Mobile Respawn Here", "PMC\PMC_Mobile_Respawn_Set.sqf", true];

waitUntil {!isNil "PMC_mobile_respawn_spot"};
player setPos PMC_mobile_respawn_spot;
// setup marker to correct position
[] execVM "PMC\PMC_Mobile_Respawn.sqf";

waitUntil { !isnil "bis_fnc_init" };

// shut the AI up!
player setVariable ["BIS_noCoreConversations", true];

sleep 3;

["Desert War", "PMC 51km Desert", "06-23-12"] spawn BIS_fnc_infoText;
//cutText ["", "BLACK IN", 2];

//[] execVM "PMC\PMC_debug.sqf";
