private["_loc", "_safePos", "_grp", "_SetupGroup"];

_loc = getPosASL base;

_SetupGroup =
{
	private ["_grp", "_wpType"];
	_grp = _this select 0;
	_wpType = _this select 1;
	_grp addWaypoint [getPosASL base, 200];
	_grp setBehaviour "AWARE";
	_grp setSpeedMode "FULL";
	_grp setFormation "LINE";
	_grp setCombatMode "RED";

	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType _wpType;
	[_grp, 1] setWaypointCompletionRadius 200;
};

_safePos = [_loc, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "infantry" >> "PMC_DeltaSquad")] call BIS_fnc_spawnGroup;
[_grp, "SENTRY"] call _SetupGroup;

_safePos = [_loc, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "infantry" >> "PMC_RangerSquad")] call BIS_fnc_spawnGroup;
[_grp, "SENTRY"] call _SetupGroup;

_safePos = [_loc, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "infantry" >> "PMC_SEALSquad")] call BIS_fnc_spawnGroup;
[_grp, "SENTRY"] call _SetupGroup;

_safePos = [_loc, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "infantry" >> "PMC_SEALsniper")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;

_safePos = [_loc, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "air" >> "PMC_SoarGunship1")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;

_safePos = [_loc, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "air" >> "PMC_SoarGunship2")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;

_safePos = [_loc, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "air" >> "PMC_SoarBlackhawks1")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;

_safePos = [_loc, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "air" >> "PMC_SoarBlackhawks2")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;

_safePos = [_loc, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "air" >> "PMC_SoarLittlebirds1")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;

_safePos = [_loc, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;
_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "WEST" >> "PMC_usforces" >> "air" >> "PMC_SoarLittlebirds2")] call BIS_fnc_spawnGroup;
[_grp, "GUARD"] call _SetupGroup;
