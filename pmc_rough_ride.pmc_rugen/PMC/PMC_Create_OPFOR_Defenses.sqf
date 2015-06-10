/*
*/
private
[
	"_array",
	"_grp"
];

// target locations
_array = _this select 0;

waituntil
{
	(!isNil "BIS_fnc_init");
};

/*
list of Russian infantry cfgGroups classes
RU_InfSquad
RU_InfSection
RU_InfSection_AT
RU_InfSection_AA
RU_InfSection_MG
RU_SniperTeam

RUS_ReconTeam

MVD_AssaultTeam

RU_MotInfSquad
RU_MotInfSection_Recon
RU_MotInfSection_Patrol

RU_MechInfSquad_1
RU_MechInfSquad_2

RU_TankPlatoon

*/
{
	_grp = [_x, EAST, (configFile >> "CfgGroups" >> "East" >> "RU" >> "Infantry" >> "RU_InfSquad")] call BIS_fnc_spawnGroup;
	[_grp, _x] execVM "PMC\bin_taskdefend.sqf";
} forEach _array;
