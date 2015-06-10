/*

	US Army Vehicles !

*/
private ["_grp","_pos","_safePos","_ran","_countUnits","_numberOfVehicles","_minimumFPS","_targetpoint"];

_countUnits = compile preprocessFileLineNumbers "PMC\PMC_Count_Group_Units.sqf";
_numberOfVehicles = _this select 0;
_minimumFPS = _this select 1;

while {true} do
{
	// new feature is && (diag_fps > 15), hopefully it wont kill gameplay totally :)
	if ( ('landVehicle' countType list pmc_blufor_list) < _numberOfVehicles && (diag_fps > _minimumFPS) && ([(list pmc_blufor_list)] call PMC_countGroups) < 144 ) then
	{
	// blufor
		// hardcoded for airbase 3...
		_pos = [1854, 2448, 0];
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 14);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Motorized" >> "US_MotorizedSection")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Motorized" >> "US_MotorizedSectionAT")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Motorized" >> "US_DeltaPatrolATV")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Motorized" >> "US_DeltaPatrolHMMWV")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Mechanized" >> "US_MechanizedInfantrySquadICVM2")] call BIS_fnc_spawnGroup;
			};
			case 5:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Mechanized" >> "US_MechanizedInfantrySquadICVMK19")] call BIS_fnc_spawnGroup;
			};
			case 6:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Mechanized" >> "US_MechanizedReconSection")] call BIS_fnc_spawnGroup;
			};
			case 7:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Armored" >> "US_MGSPlatoon")] call BIS_fnc_spawnGroup;
			};
			case 8:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Armored" >> "US_M1A2Platoon")] call BIS_fnc_spawnGroup;
			};
			case 9:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Armored" >> "US_M1A1Platoon")] call BIS_fnc_spawnGroup;
			};
			case 10:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_US" >> "Armored" >> "US_M1A2Section")] call BIS_fnc_spawnGroup;
			};
			// Czech :)
			case 11:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_CZ" >> "Motorized" >> "ACR_MotorizedPatrol")] call BIS_fnc_spawnGroup;
			};
			case 12:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_CZ" >> "Motorized" >> "ACR_SpecialForcesPatrolLandRover")] call BIS_fnc_spawnGroup;
			};
			case 13:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "BIS_CZ" >> "Motorized" >> "ACR_SpecialForcesPatrolATV")] call BIS_fnc_spawnGroup;
			};
		};

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} forEach units _grp;

		// select target
		_targetpoint = PMC_loc select (random (count PMC_loc));
		// jiggle the fucker as it was array of cooridinates
		pmc_temp_logic setPos _targetpoint;

		[_grp, _targetpoint, 100] call PMC_Guard_Vehicle_Waypoints;

		diag_log format["Created US vehicles: %1, total: %2", ([_grp] call _countUnits), ('landVehicle' countType list pmc_blufor_list)];
	};

	sleep 60;
};
