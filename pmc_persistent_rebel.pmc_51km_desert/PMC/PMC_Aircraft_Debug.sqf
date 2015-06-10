private ["_vcl", "_grp"];

_vcl = _this select 0;
_grp = group (crew _vcl select 0);

diag_log "";
diag_log format
[
	"PMC_Aircraft_Debug, _vcl: %1, fuel: %2, pos: %3, _grp: %4 alive _vcl: %5, damage _vcl: %6, alive _grp: %7, time: %8, fps: %9",
	typeOf (vehicle _vcl),
	(fuel _vcl),
	(getPosASL _vcl),
	_grp,
	(alive _vcl),
	(getDammage _vcl),
	(alive leader _grp),
	time,
	diag_fps
];

/* useless debug
diag_log format
[
	"Weapons: %1", weapons _vcl
];
diag_log format
[
	"magazines: %1", magazines _vcl
];
*/
diag_log "";

// public variable thing
PMC_Downed_Aircraft = _vcl;
publicVariable "PMC_Downed_Aircraft";
