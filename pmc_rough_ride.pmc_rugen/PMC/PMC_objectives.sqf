/*



*/
private
[
	"_a",
	"_array",
	"_m",
	"_markerobj",
	"_triggerArea",
	"_triggerString",
	"_triggerTimeout",
	"_z"
];

_array = _this select 0;
_triggerArea = _this select 1;
_triggerTimeout = _this select 2;
_a = 1;
_triggerString = [];

{
	_z = createTrigger ["EmptyDetector", _x];
	_z setTriggerActivation ["WEST SEIZED", "PRESENT", true];
	_z setTriggerArea [_triggerArea, _triggerArea, 0, true];
	_z setTriggerTimeout [0, (_triggerTimeout/2), _triggerTimeout, true];
	_z setTriggerStatements ["this", format ["'pmc_objective_marker%1' setMarkerColor 'ColorGreen'; PMC_objective%1 setTaskState 'SUCCEEDED'; PMC_objectives_done set [%1, true];", _a], ""];

	_m = format ["pmc_objective_marker%1", _a];
	_markerobj = createMarker [_m, _x];
	_markerobj setMarkerShape "ELLIPSE";
	_markerobj setMarkerColor "ColorRed";
	_markerobj setMarkerBrush "Solid";
	_markerobj setMarkerSize [_triggerArea, _triggerArea];

	// special preparation of string to be placed in ending trigger
	_triggerString = _triggerString + [false];

	_a = _a + 1;
} forEach _array;


// prep the global array for trigger is true thingy
PMC_objectives_done = [];
PMC_objectives_done = _triggerString;

// all obj are done trigger
_z = createTrigger ["EmptyDetector", [100,100,0]];
_z setTriggerActivation ["None", "PRESENT", true];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, true];
_z setTriggerStatements ["({_x} count PMC_objectives_done == count PMC_objectives_done)", "pmc_mcomplete = true; hint ""trigger activated."";", ""];

// ending trigger
_z = createTrigger ["EmptyDetector", [100,50,0]];
_z setTriggerType "END1";
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [3, 3, 3, true];
_z setTriggerStatements ["pmc_mcomplete", "", ""];
