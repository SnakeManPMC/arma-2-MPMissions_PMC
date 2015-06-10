/*

	PMC_Place_Editor_Units.sqf

place our mission editor guys into somewhere else than in the lower left corner

unit_blufor1
unit_opfor1
unit_ind1
unit_civ1

PMCTODO - add some check not to place them in same cities as other factions AND x meters away from closest enemy city.
	
*/

{
	_x setPos ( PMC_CityCenters select (floor (random count PMC_CityCenters)) );
} forEach [unit_blufor1, unit_opfor1, unit_ind1, unit_civ1];
