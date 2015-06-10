
private["_loc", "_safePos", "_grp", "_SetupGroup"];

_SetupGroup =
{
	private ["_grp"];
	_grp = _this select 0;
	_grp addWaypoint [getPosASL leader _grp, 50];
	_grp setBehaviour "AWARE";
	_grp setSpeedMode "FULL";
	_grp setFormation "LINE";
	_grp setCombatMode "RED";

	[_grp, 1] setWaypointBehaviour "AWARE";
	[_grp, 1] setWaypointCombatMode "RED";
	[_grp, 1] setWaypointSpeed "FULL";
	[_grp, 1] setWaypointFormation "WEDGE";
	[_grp, 1] setWaypointType "GUARD";
	[_grp, 1] setWaypointCompletionRadius 100;

	{
		_x addEventHandler ["killed", {handle = _this execVM "PMC_killed.sqf"}];
	} foreach units _grp;
	//_vcl addEventHandler ["killed", {handle = _this execVM "PMC_killed.sqf"}];
};

while {true} do
{
	// if we have less then 50 guys running around, create more
	if ( (count list pmc_opfor_list < 300) ) then
	{
		_loc = getPosASL call PMC_Select_Target;
		_safePos = [_loc, 0, 200, 10, 0, 10, 0] call BIS_fnc_findSafePos;
		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "PMC_militia" >> "infantry" >> "PMC_Militia_Group_1")] call BIS_fnc_spawnGroup;
		[_grp] call _SetupGroup;
		
		_loc = getPosASL call PMC_Select_Target;
		_safePos = [_loc, 0, 200, 10, 0, 10, 0] call BIS_fnc_findSafePos;
		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "PMC_militia" >> "infantry" >> "PMC_Militia_Group_2")] call BIS_fnc_spawnGroup;
		[_grp] call _SetupGroup;
		
		_loc = getPosASL call PMC_Select_Target;
		_safePos = [_loc, 0, 200, 10, 0, 10, 0] call BIS_fnc_findSafePos;
		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "PMC_militia" >> "infantry" >> "PMC_Special_Militia")] call BIS_fnc_spawnGroup;
		[_grp] call _SetupGroup;
		
		_loc = getPosASL call PMC_Select_Target;
		_safePos = [_loc, 0, 200, 10, 0, 10, 0] call BIS_fnc_findSafePos;
		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "PMC_militia" >> "infantry" >> "PMC_Militia_RPG_Teams")] call BIS_fnc_spawnGroup;
		[_grp] call _SetupGroup;
	
		_loc = getPosASL call PMC_Select_Target;
		_safePos = [_loc, 0, 200, 10, 0, 10, 0] call BIS_fnc_findSafePos;
		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "PMC_militia" >> "infantry" >> "PMC_MilitiaTechnicals1")] call BIS_fnc_spawnGroup;
		[_grp] call _SetupGroup;
	
		_loc = getPosASL call PMC_Select_Target;
		_safePos = [_loc, 0, 200, 10, 0, 10, 0] call BIS_fnc_findSafePos;
		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "EAST" >> "PMC_militia" >> "infantry" >> "PMC_MilitiaTechnicals2")] call BIS_fnc_spawnGroup;
		[_grp] call _SetupGroup;

		diag_log format["Created units, count now: %1", (count list pmc_opfor_list)];
	};
	
//	player sidechat format["Going to sleep, count now: %1 ...", (count list pmc_opfor_list)];
	sleep 5;
};
