/*

	OPFOR war script

*/

private ["_totalGroups", "_a","_respawnpoint","_targetpoint","_rand","_PMC_MakeTankOPFOR","_PMC_MakeTankOPFORHeavy","_PMC_MakeArtillerySite","_PMC_MakeArmedCar","_PMC_Make_OPFOR_Soft_Vehicles","_PMC_MakeHind","_PMC_MakeSupport","_PMC_SelectOPFORStartPosit","_ForceLevel","_waypointRanPosit"];

_PMC_MakeTankOPFOR = compile preprocessFileLineNumbers "PMC\PMC_MakeTankOPFOR.sqf";
_PMC_MakeTankOPFORHeavy = compile preprocessFileLineNumbers "PMC\PMC_MakeTankOPFORHeavy.sqf";
_PMC_MakeArtillerySite = compile preprocessFileLineNumbers "PMC\PMC_MakeArtillerySite.sqf";
_PMC_MakeArmedCar = compile preprocessFileLineNumbers "PMC\PMC_MakeArmedCar.sqf";
_PMC_Make_OPFOR_Soft_Vehicles = compile preprocessFileLineNumbers "PMC\PMC_Make_OPFOR_Soft_Vehicles.sqf";
_PMC_MakeHind = compile preprocessFileLineNumbers "PMC\PMC_MakeHind.sqf";
_PMC_MakeSupport = compile preprocessFileLineNumbers "PMC\PMC_MakeSupport.sqf";
_PMC_SelectOPFORStartPosit = compile preprocessFileLineNumbers "PMC\PMC_SelectOPFORStartPosit.sqf";

// how many cycles of troops we create. 20 creates about 150-180 units.
_ForceLevel = call compile preprocessFileLineNumbers "PMC\PMC_Get_Max_Units.sqf";

// our waypoints random circle range
_waypointRanPosit = 1000;

// track how many groups we created, so we can limit it to 144
_totalGroups = 1;

// create units (one group from mission editor, dont forget)
_a = 1;
PMC_opfor = 0;
while { _a < _ForceLevel && _totalGroups < 143 } do
{
	// choose one of the random starting locations
	_respawnpoint = [] call _PMC_SelectOPFORStartPosit;
	// workaround for being lazy.
	_targetpoint = _respawnpoint;

	_rand = floor (random 8);
	switch (_rand) do
	{
		case 0:
	    	{
			// Single tank
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeTankOPFOR;
			_a = _a + 1;
			_totalGroups = _totalGroups + 1;
	    	};
	    	case 1:
	    	{
			// Single armed car
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeArmedCar;
			_a = _a + 1;
			_totalGroups = _totalGroups + 1;
	    	};
		case 2:
		{
			// Platoon of 4 tanks
			// 4 vehicles
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeTankOPFORHeavy;
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			_a = _a + 5;
			_totalGroups = _totalGroups + 2;
		};
		case 3:
		{
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			_a = _a + 4;
			_totalGroups = _totalGroups + 4;
		};
		case 4:
		{
			// Artillery site 4 D-30 guns
			// 4 vehicles
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeArtillerySite;
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_Make_OPFOR_Soft_Vehicles;
			_a = _a + 6;
			_totalGroups = _totalGroups + 3;
		};
		case 5:
		{
			// Hinds
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeHind;
			_a = _a + 1;
			_totalGroups = _totalGroups + 1;
		};
		case 6:
		{
			// Support trucks
			[_respawnpoint, _targetpoint, _waypointRanPosit] call _PMC_MakeSupport;
			_a = _a + 5;
			_totalGroups = _totalGroups + 1;
		};
		case 7:
		{
			if ( ((paramsarray select 3) == 0) ) then
			{
				// ZSU site.
				[_respawnpoint] call compile preprocessFileLineNumbers "PMC\PMC_create_zsu_site.sqf";
				_a = _a + 4;
				_totalGroups = _totalGroups + 1;
			};
		};
	};
	sleep 1;
	//diag_log format["creating %1 PMC_opfor, %2 groups and %3 _a...", PMC_opfor, _totalGroups, _a];
};

diag_log format["OPFOR script exited with: %1 PMC_opfor, %2 groups created and %3 _a.", PMC_opfor, _totalGroups, _a];
