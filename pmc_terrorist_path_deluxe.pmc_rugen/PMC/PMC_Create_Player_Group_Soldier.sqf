private
[
	"_UnitTypes",
	"_MyUnit",
	"_unit"
];

_UnitTypes =
[
	"GUE_Commander",
	"GUE_Soldier_1",
	"GUE_Soldier_2",
	"GUE_Soldier_3",
	"GUE_Soldier_AA",
	"GUE_Soldier_AR",
	"GUE_Soldier_AT",
	"GUE_Soldier_CO",
	"GUE_Soldier_Crew",
	"GUE_Soldier_GL",
	"GUE_Soldier_Medic",
	"GUE_Soldier_MG",
	"GUE_Soldier_Pilot",
	"GUE_Soldier_Sab",
	"GUE_Soldier_Scout",
	"GUE_Soldier_Sniper"
];

_MyUnit = _UnitTypes select (random count _UnitTypes);

_unit = group player createUnit [_MyUnit, position player, [], 0, "FORM"];
_unit addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
removeAllWeapons _unit;
addSwitchableUnit _unit;
[_unit] joinSilent group player;

/*
unitName setSkill [type, skill]

aimingAccuracy
aimingShake
aimingSpeed
endurance
spotDistance
spotTime
courage
reloadSpeed
commanding
general

hero setskill ["Endurance", 0.7];

*/
