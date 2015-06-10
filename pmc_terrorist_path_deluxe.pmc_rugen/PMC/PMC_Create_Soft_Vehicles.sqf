/*

	EAST

RU

- Motorized
	- RU_MotInfSquad		(truck + many men)
	- RU_MotInfSection_Recon	(2 armed vodniks + many men)
	- RU_MotInfSection_Patrol	(armed vodnik + few men)

- Mechanized
	- RU_MechInfSquad_1	(bmp + men)
	- RU_MechInfSquad_2	(btr + men)

- Armored
	- RU_TankPlatoon	(3 t90's)

	WEST

USMC
- Motorized
	- USMC_MotInfSection	(two armed hummers + men)
	- USMC_MotInfSection_AT	(two TOW hummers + couple of guys)

- Mechanized
	- USMC_MechInfSquad	(aavp7 + men)
	- USMC_MechReconSection	(lav-25 + men)

- Armored
	- USMC_TankPlatoon	(4 m1a2 tusk's)

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
	if ( ('landVehicle' countType list pmc_opfor_list) < 10 ) then
	{
		// add some stupid debug info
		player sideChat "Creating OPFOR Vehicles's!";
		[] execVM "PMC\PMC_Count_All_Units.sqf";
	// opfor
		_pos = getPosASL opfor_land_start;
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 6);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Motorized" >> "RU_MotInfSquad")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Motorized" >> "RU_MotInfSection_Recon")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Motorized" >> "RU_MotInfSection_Patrol")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Mechanized" >> "RU_MechInfSquad_1")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Mechanized" >> "RU_MechInfSquad_2")] call BIS_fnc_spawnGroup;
			};
			case 5:
			{
				_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Armored" >> "RU_TankPlatoon")] call BIS_fnc_spawnGroup;
			};
		};

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} forEach units _grp;

		//_targetpoint = call PMC_Select_Target;
		PMC_temporary_location setPos (PMC_Locations select (random count PMC_Locations));
		_targetpoint = PMC_temporary_location;

		[_grp, _targetpoint, 0] call PMC_Sentry_Inf_Waypoints;
	};

	if ( ('landVehicle' countType list pmc_blufor_list) < 10 ) then
	{
		// add some stupid debug info
		player sideChat "Creating BLUFOR Vehicles's!";
		[] execVM "PMC\PMC_Count_All_Units.sqf";
	// blufor
		_pos = getPosASL blufor_land_start;
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_ran = floor (random 5);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Motorized" >> "USMC_MotInfSection")] call BIS_fnc_spawnGroup;
			};
			case 1:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Motorized" >> "USMC_MotInfSection_AT")] call BIS_fnc_spawnGroup;
			};
			case 2:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Mechanized" >> "USMC_MechInfSquad")] call BIS_fnc_spawnGroup;
			};
			case 3:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Mechanized" >> "USMC_MechReconSection")] call BIS_fnc_spawnGroup;
			};
			case 4:
			{
				_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Armored" >> "USMC_TankPlatoon")] call BIS_fnc_spawnGroup;
			};
		};

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} forEach units _grp;

		//_targetpoint = call PMC_Select_Target;
		PMC_temporary_location setPos (PMC_Locations select (random count PMC_Locations));
		_targetpoint = PMC_temporary_location;

		[_grp, _targetpoint, 0] call PMC_Sentry_Inf_Waypoints;
	};

	sleep 60;
};
