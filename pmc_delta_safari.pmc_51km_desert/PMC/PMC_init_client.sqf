
// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

[] execVM "PMC\PMC_public_eventhandlers.sqf";

player setVariable ["BIS_noCoreConversations", true];

// after respawning player has no weapons and gets the addaction's back
removeAllWeapons player;
player addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"; handle = _this execVM "PMC\PMC_respawnPlayer.sqf"}];

// try to setup respawn marker properly...
if (!isNil "PMC_Setup_My_FOB") then
{
	// PMC_Setup_FOB is variable of the coords of our last FOB
	"respawn_west" setMarkerPosLocal PMC_Setup_My_FOB;
	diag_log format["!isNil: PMC_Setup_FOB: %1", PMC_Setup_My_FOB];
	
	// place our player there
	// this is stupid, why dont setpos pmc_setup_my_fob doesnt work?
	player setPosASL getMarkerPos "respawn_west";
	
	//player sidechat format["PMC_Setup_My_FOB: %1", PMC_Setup_My_FOB];
	//hint format["PMC_Setup_My_FOB: %1", PMC_Setup_My_FOB];
};

sleep 10;

// try to create markers according to the mission objectives, so that JIP players also see them
{
	[(getPosASL leader _x)] call compile preprocessFileLineNumbers "PMC\PMC_Create_Marker_Local.sqf"
} forEach (PMC_vips + PMC_scuds);
//hint format["PMC_vips: %1\n\nPMC_scuds: %2", PMC_vips, PMC_scuds];

call compile preprocessFileLineNumbers "PMC\time_used_update.sqf";
["Mission Time", (call PMC_Time_Used_Update), "Good luck"] spawn BIS_fnc_infoText;

sleep 20;
titleText["Change view distance from the flag pole.", "plain down", 2];
hintSilent "Change view distance from the flag pole.";

sleep 20;
[] execVM "PMC\PMC_AddAction.sqf";
