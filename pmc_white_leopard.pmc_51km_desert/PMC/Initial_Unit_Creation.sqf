
// create initial units

private ["_grp","_a","_respawnpoint","_ran","_safePos", "_tmpLocations"];

// tmp locations where we subtract
_tmpLocations = [];
_tmpLocations = PMC_loc;
diag_log format["At start _tmpLocations is: %1.", count _tmpLocations];

_a = 0;
while {_a < 10 && (count _tmpLocations > 0)} do
{
	_a = _a + 1;

	// select target
	_respawnpoint = _tmpLocations select (floor random (count _tmpLocations));
	_tmpLocations = _tmpLocations - [_respawnpoint];
	_safePos = [_respawnpoint, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
	_respawnpoint = _safePos;

	_ran = floor (random 5);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army;
			waitUntil {!(isNull _grp)};
		};
		case 1:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Sniper;
			waitUntil {!(isNull _grp)};
		};
		case 2:
		{
			_grp = [_respawnpoint] call PMC_Create_US_Army_Support;
			waitUntil {!(isNull _grp)};
		};
		case 3:
		{
			_grp = [_respawnpoint] call PMC_Create_US_ArmyWeapons;
			waitUntil {!(isNull _grp)};
		};
		case 4:
		{
			_grp = [_respawnpoint] call PMC_Create_US_DeltaForce;
			waitUntil {!(isNull _grp)};
		};
	};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// add one group created.
	PMC_grp_blufor = PMC_grp_blufor + 1;

	[_grp, leader _grp, 0] call PMC_Guard_Inf_Waypoints;
};




//
_a = 0;
while {_a < 10 && (count _tmpLocations > 0)} do
{
	_a = _a + 1;

	// select target
	_respawnpoint = _tmpLocations select (floor random (count _tmpLocations));
	_tmpLocations = _tmpLocations - [_respawnpoint];
	_safePos = [_respawnpoint, 0, 100, 30, 0, 20, 0] call BIS_fnc_findSafePos;
	_respawnpoint = _safePos;

	_ran = floor (random 5);
	switch (_ran) do
	{
		case 0:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army;
			waitUntil {!(isNull _grp)};
		};
		case 1:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Sniper;
			waitUntil {!(isNull _grp)};
		};
		case 2:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Support;
			waitUntil {!(isNull _grp)};
		};
		case 3:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Militia;
			waitUntil {!(isNull _grp)};
		};
		case 4:
		{
			_grp = [_respawnpoint] call PMC_Create_Takistani_Army_Special_Purpose;
			waitUntil {!(isNull _grp)};
		};
	};

	// put group into recycle script
	[_grp] execVM "PMC\PMC_groupRecycle.sqf";

	// add one group created.
	PMC_grp_opfor = PMC_grp_opfor + 1;

	[_grp, leader _grp, 0] call PMC_Guard_Inf_Waypoints;
};

diag_log format["At end _tmpLocations is: %1.", count _tmpLocations];
