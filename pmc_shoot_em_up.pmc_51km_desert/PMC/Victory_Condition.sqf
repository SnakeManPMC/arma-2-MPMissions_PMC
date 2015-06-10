private
[
	"_targetpoint",
	"_marker",
	"_z"
];

_targetpoint = _this select 0;

// BLUFOR present
_z = createTrigger ["EmptyDetector", _targetpoint];
_z setTriggerActivation ["WEST", "PRESENT", false];
_z setTriggerArea [50, 50, 0, true];
_z setTriggerTimeout [0, 0, 0, false];
_z setTriggerStatements ["this", "hint 'you have won!'; player sidechat 'we have won!'; 'target1' setMarkerColor 'colorgreen'; 'target1' setMarkerType 'dot'; pmc_mcomplete = true;", ""];

// marker for out target area
_marker = createMarkerLocal ["target1", _targetpoint];
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTypeLocal "mil_objective";

// mission end
_z = createTrigger ["EmptyDetector", _targetpoint];
_z setTriggerActivation ["NONE", "PRESENT", false];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [30, 30, 30, false];
_z setTriggerStatements ["pmc_mcomplete", "", ""];
_z setTriggerType "END1";
