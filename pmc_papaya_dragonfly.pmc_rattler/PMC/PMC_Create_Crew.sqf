/*

Creates crew for given vehicle.

Syntax:
[vehicle, group] execVM "PMC\PMC_create_crew.sqf";

Requires:
-

*/

private
[
	"_vcl",
	"_grp"
];

_vcl = _this select 0;
_grp = _this select 1;

// check if have turrets, then creates gunners for them.
for "_i" from 0 to ((count (configFile >> "CfgVehicles" >> (typeOf _vcl) >> "Turrets")) - 1) do
{
	if (side (leader _grp) == WEST) then
	{
		"US_Soldier_Pilot_EP1" createUnit [getPosASL leader _grp, _grp, "", 1, "CORPORAL"];
	}
	else
	{
		"TK_Soldier_Pilot_EP1" createUnit [getPosASL leader _grp, _grp, "", 1, "CORPORAL"];
	};
	(units _grp select (_i + 1)) moveinTurret [_vcl, [_i]];
};
