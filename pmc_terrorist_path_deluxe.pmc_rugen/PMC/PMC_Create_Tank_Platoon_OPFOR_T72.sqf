private
[
	"_grp",
	"_pos",
	"_safePos"
];

while {true} do
{
	// was "tank" before, now just land vehicle
	if ( ('landVehicle' countType list pmc_opfor_list) < 9 ) then
	{
		player sideChat "Creating OPFOR TANKS!"; hintSilent "Creating OPFOR TANKS!";
	// opfor
		_pos = getPosASL opfor_land_start;
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_grp = [_safePos, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Armored" >> "RU_TankPlatoon")] call BIS_fnc_spawnGroup;

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} forEach units _grp;

		//_targetpoint = call PMC_Select_Target;
		PMC_temporary_location setPos (PMC_Locations select (random count PMC_Locations));
		_targetpoint = PMC_temporary_location;

		[_grp, _targetpoint, 0] call PMC_Sentry_Inf_Waypoints;
	};

	if ( ('landVehicle' countType list pmc_blufor_list) < 9 ) then
	{
		player sideChat "Creating BLUFOR TANKS!"; hintSilent "Creating BLUFOR TANKS!";
	// blufor
		_pos = getPosASL blufor_land_start;
		_safePos = [_pos, 0, 500, 30, 0, 20, 0] call BIS_fnc_findSafePos;

		_grp = [_safePos, WEST, (configFile >> "CfgGroups" >> "West" >> "USMC" >> "Armored" >> "USMC_TankPlatoon")] call BIS_fnc_spawnGroup;

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
