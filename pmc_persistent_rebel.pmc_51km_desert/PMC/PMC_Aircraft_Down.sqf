/*

	PMC Aircraft Down Scenario
	
	What happens when script created aircraft is downed for whatever reason but does not count as "killed"?
	... this script will make magic happen to those junk aircraft hulls ;)

*/

private
[
	"_vcl"
];

// aircraft name from parameter
_vcl = _this select 0;

// add some sleep so if the aircraft is kind of slowly cooking into explosion by itself or enemy fire etc.
sleep 60;

// if he is dead, then we exit...
if (!alive _vcl) exitWith{};

// if not, we continue to do magic

if (PMC_debug) then
{
	diag_log format
	[
		"PMC_Aircraft_Down _vcl: %1, destroyed in pos: %2.",
		(typeOf _vcl),
		(getPosASL _vcl)
	];
};

_vcl setDamage 1;
