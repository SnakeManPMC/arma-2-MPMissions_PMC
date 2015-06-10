
private
[
	"_myPlayer"
];

_myPlayer = _this select 0;

if (PMC_debug) then { diag_log format["PMC_respawnPlayer.sqf #############################   _myPlayer: %1", _myPlayer]; };

waitUntil
{
	(alive player);
};

if (PMC_debug) then { diag_log format["PMC_respawnPlayer.sqf ##############################  After waitUntil: %1", player]; };

// human respawn bodies are removed also.
player addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

removeAllWeapons player;

[] execVM "PMC\PMC_AddAction.sqf";
