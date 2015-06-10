/*

	Takistani and US Army Vehicles !

*/
private
[
	"_grp",
	"_pos",
	"_safePos",
	"_ran"
];

while {true} do
{
	// was "car" before, now just land vehicle
	if ( ('landVehicle' countType list pmc_opfor_list) < 15 ) then
	{
	// opfor
		// hardcoded to harbor 4...
		_pos = [11634, 49031, 0];
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 11);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Motorized" >> "TK_MotorizedInfanterySquad")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Motorized" >> "TK_MotorizedReconSection")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Motorized" >> "TK_MotorizedPatrol")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Mechanized" >> "TK_MechanizedInfantrySquadBMP2")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Mechanized" >> "TK_MechanizedInfantrySquadBTR60")] call BIS_fnc_spawnGroup;
			};
			case 5:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Mechanized" >> "TK_MechanizedSpecialSquad")] call BIS_fnc_spawnGroup;
			};
			case 6:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Mechanized" >> "TK_MechanizedReconSection")] call BIS_fnc_spawnGroup;
			};
			case 7:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Mechanized" >> "TK_MechanizedReconSectionAT")] call BIS_fnc_spawnGroup;
			};
			case 8:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Armored" >> "TK_T72Platoon")] call BIS_fnc_spawnGroup;
			};
			case 9:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Armored" >> "TK_T55Platoon")] call BIS_fnc_spawnGroup;
			};
			case 10:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "BIS_TK" >> "Armored" >> "TK_T34Platoon")] call BIS_fnc_spawnGroup;
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
	};

	if ( ('landVehicle' countType list pmc_blufor_list) < 15 ) then
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
	};

	sleep 60;
};
