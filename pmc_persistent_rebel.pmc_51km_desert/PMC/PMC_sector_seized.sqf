/*
	Sector settings from trigger SEIZED BY <KALA>

Syntax:
["markername", "BLUFOR"] execVM "PMC\PMC_sector_seized.sqf";

Requires:
-

Return:
-

*/

private
[
	"_pmc_sector",
	"_pmc_side"
];

_pmc_sector = _this select 0;
_pmc_side = _this select 1;

if (_pmc_side == "BLUFOR") then
{
	_pmc_sector setMarkerColorLocal "ColorBlue";
};

if (_pmc_side == "OPFOR") then
{
	_pmc_sector setMarkerColorLocal "ColorRed";
};

if (_pmc_side == "Independent") then
{
	_pmc_sector setMarkerColorLocal "ColorGreen";
};

hintSilent format["%1 has seized %2!", _pmc_side, _pmc_sector];
