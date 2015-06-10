
private
[
	"_myPlayer"
];

_myPlayer = _this select 0;

//player sideChat format["#############################   _myPlayer: %1", _myPlayer];
if (PMC_debug) then { diag_log format["PMC_respawnPlayer.sqf #############################   _myPlayer: %1", _myPlayer]; };

waitUntil
{
	(alive player);
};

//player sideChat format["##############################  After waitUntil: %1", player];
if (PMC_debug) then { diag_log format["PMC_respawnPlayer.sqf ##############################  After waitUntil: %1", player]; };

// human respawn bodies are removed also.
player addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

// he has to pickup weapons after respawn. perhaps too much trouble?
removeAllWeapons player;

// strange way to count how any friendly KIAs?
PMC_PlayerRespawns = PMC_PlayerRespawns + 1;
publicVariable "PMC_PlayerRespawns";

hint format["You have respawned, your name is: %1\nAll player respawns: %2", player, PMC_PlayerRespawns];
