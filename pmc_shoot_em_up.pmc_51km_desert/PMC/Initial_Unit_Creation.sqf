
// create initial units

private ["_grp","_a","_respawnpoint","_ran","_safePos","_objective_pos"];

// our target location
_objective_pos = _this select 0;

// OPFOR
_a = 0;
while {_a < (2 + random 15)} do
{
	_a = _a + 1;

	_ran = floor (random 5);
	switch (_ran) do
	{
		case 0:
		{
			_safePos = [_objective_pos, 0, 50, 10, 0, 10, 0] call BIS_fnc_findSafePos;
			_grp = [_safePos] call PMC_Create_Takistani_Army;
			waitUntil {!(isNull _grp)};
		};
		case 1:
		{
			_safePos = [_objective_pos, 0, 50, 10, 0, 10, 0] call BIS_fnc_findSafePos;
			_grp = [_safePos] call PMC_Create_Takistani_Army_Sniper;
			waitUntil {!(isNull _grp)};
		};
		case 2:
		{
			_safePos = [_objective_pos, 0, 50, 10, 0, 10, 0] call BIS_fnc_findSafePos;
			_grp = [_safePos] call PMC_Create_Takistani_Army_Support;
			waitUntil {!(isNull _grp)};
		};
		case 3:
		{
			_safePos = [_objective_pos, 0, 50, 10, 0, 10, 0] call BIS_fnc_findSafePos;
			_grp = [_safePos] call PMC_Create_Takistani_Militia;
			waitUntil {!(isNull _grp)};
		};
		case 4:
		{
			_safePos = [_objective_pos, 0, 50, 10, 0, 10, 0] call BIS_fnc_findSafePos;
			_grp = [_safePos] call PMC_Create_Takistani_Army_Special_Purpose;
			waitUntil {!(isNull _grp)};
		};
	};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// add one group created.
	PMC_grp_opfor = PMC_grp_opfor + 1;

	[_grp, _objective_pos, (random 50)] call PMC_Guard_Inf_Waypoints;
};


// blufor attack
_a = 0;
while {_a < (random 5)} do
{
	_a = _a + 1;

	_ran = floor (random 5);
	switch (_ran) do
	{
		case 0:
		{
			_usPos = [_objective_pos, 0, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			_grp = [_usPos] call PMC_Create_US_Army;
			waitUntil {!(isNull _grp)};
		};
		case 1:
		{
			_usPos = [_objective_pos, 0, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			_grp = [_usPos] call PMC_Create_US_Army_Sniper;
			waitUntil {!(isNull _grp)};
		};
		case 2:
		{
			_usPos = [_objective_pos, 0, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			_grp = [_usPos] call PMC_Create_US_Army_Support;
			waitUntil {!(isNull _grp)};
		};
		case 3:
		{
			_usPos = [_objective_pos, 0, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			_grp = [_usPos] call PMC_Create_US_ArmyWeapons;
			waitUntil {!(isNull _grp)};
		};
		case 4:
		{
			_usPos = [_objective_pos, 0, 50, 30, 0, 20, 0] call BIS_fnc_findSafePos;
			_grp = [_usPos] call PMC_Create_US_DeltaForce;
			waitUntil {!(isNull _grp)};
		};
	};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// add one group created.
	PMC_grp_blufor = PMC_grp_blufor + 1;

	[_grp, _safePos, 0] call PMC_Guard_Inf_Waypoints;
};
