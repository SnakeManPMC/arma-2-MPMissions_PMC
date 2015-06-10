
// global ending trigger for whole mission, this is it, KAPUT!

private
[
	"_z"
];


// BLUFOR list of units
pmc_bluforunits = createTrigger ["EmptyDetector", [6500, 6500, 0]];
pmc_bluforunits setTriggerActivation ["WEST", "PRESENT", true];
pmc_bluforunits setTriggerArea [6500, 6500, 0, true];
pmc_bluforunits setTriggerTimeout [0, 0, 0, true];

// OPFOR list of units
pmc_opforunits = createTrigger ["EmptyDetector", [6500, 6500, 0]];
pmc_opforunits setTriggerActivation ["EAST", "PRESENT", true];
pmc_opforunits setTriggerArea [6500, 6500, 0, true];
pmc_opforunits setTriggerTimeout [0, 0, 0, true];

// Weather Forecast radio call
_z = createTrigger ["EmptyDetector", [6400, 6400, 0]];
_z setTriggerActivation ["ALPHA", "PRESENT", true];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, true];
_z setTriggerText "Weather Forecast";
_z setTriggerStatements ["this", "this = execVM ""PMC\PMC_weather_forecast.sqf"";", ""];

/* this needs to be disabled for release version too I'm afraid
// Debug on/off radio call
_z = createTrigger ["EmptyDetector", [6300, 6300, 0]];
_z setTriggerActivation ["BRAVO", "PRESENT", true];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, true];
_z setTriggerText "Debug ON";
_z setTriggerStatements ["this", "if (PMC_debug) then { PMC_debug = false; 2 setRadioMsg ""Debug ON""; } else { PMC_debug = true; 2 setRadioMsg ""Debug OFF""; };", ""];
*/

// Mission End
_z = createTrigger ["EmptyDetector", [6200, 6200, 0]];
_z setTriggerActivation ["ANYBODY", "PRESENT", false];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, true];
_z setTriggerType "END1";
_z setTriggerStatements ["pmc_mcomplete", "", ""];

/* too debug for release version :)
// Camera.sqs radio call
_z = createTrigger ["EmptyDetector", [6200, 6200, 0]];
_z setTriggerActivation ["CHARLIE", "PRESENT", true];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, true];
_z setTriggerText "DEBUG start camera.sqs";
_z setTriggerStatements ["this", "player exec ""camera.sqs"";", ""];
*/

// Set respawn here radio call
_z = createTrigger ["EmptyDetector", [6200, 6200, 0]];
_z setTriggerActivation ["JULIET", "PRESENT", true];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, true];
_z setTriggerText "Set respawn here";
_z setTriggerStatements ["this", """respawn_guer"" setMarkerPos getPosASL leader pmc_locals1; hint format[""Respawn marker set to: %1"", getPosASL leader pmc_locals1];", ""];

// however this is created only when we have enough blufor and opfor units, so it wont activate too soon.
waitUntil
{
	sleep 1;
	( (count list pmc_opforunits) > 0 && (count list pmc_bluforunits) > 0 );
};

if (PMC_debug) then { diag_log "#### Successfully passed trigger creation waitUntil, creating ending trigger now."; };

_z = createTrigger ["EmptyDetector", [6400, 6400, 0]];
_z setTriggerStatements ["!PMC_war_blufor && !PMC_war_opfor && ((count list pmc_opforunits + count list pmc_bluforunits)) < 50", "PMC_mcomplete = true; publicVariable ""PMC_mcomplete""; diag_log format[""Mission end at: %1"", time];", ""];


/*

	mission.sqm help text

position[]={6553.0112,325.78741,6334.7896};
a=6500;
b=6500;
rectangular=1;
activationBy="EAST";
repeating=1;
interruptable=1;
name="pmc_opforunits";

position[]={6558.6304,327.30243,6326.6128};
a=6500;
b=6500;
rectangular=1;
activationBy="WEST";
repeating=1;
interruptable=1;
name="pmc_bluforunits";

position[]={7154.2617,257.53467,7055.3975};
a=0;
b=0;
activationBy="ALPHA";
repeating=1;
interruptable=1;
text="Weather forecast";
expActiv="this = execVM ""PMC\PMC_weather_forecast.sqf"";";

position[]={7157.5171,258.62564,7052.4048};
a=0;
b=0;
activationBy="BRAVO";
repeating=1;
interruptable=1;
text="Debug ON";
expActiv="if (PMC_debug) then { PMC_debug = false; 2 setRadioMsg ""Debug ON""; } else { PMC_debug = true; 2 setRadioMsg ""Debug OFF""; };";

position[]={7164.9629,261.51959,7037.9072};
a=0;
b=0;
interruptable=1;
type="END1";
text="END";
expCond="pmc_mcomplete";

position[]={7160.7251,259.81732,7049.5361};
a=0;
b=0;
activationBy="CHARLIE";
repeating=1;
interruptable=1;
text="DEBUG start camera.sqs";
expActiv="player exec ""camera.sqs"";";

position[]={7164.7207,261.4165,7046.3413};
a=0;
b=0;
activationBy="JULIET";
repeating=1;
interruptable=1;
text="Set respawn here";
expActiv="""respawn_guer"" setMarkerPos getPosASL leader pmc_locals1; hint format[""Respawn marker set to: %1"", getPosASL leader pmc_locals1];";


	Sector - Triggers

position[]={2082.0239,212.05699,11281.352};
a=1500;
b=1500;
rectangular=1;
activationBy="EAST SEIZED";
repeating=1;
timeoutMin=60;
timeoutMax=60;
interruptable=1;
text="Seized by OPFOR!";
expActiv="this = [""sector1"", ""OPFOR""] execVM ""PMC\PMC_sector_seized.sqf"";";

position[]={2082.5132,212.09532,11280.916};
a=1500;
b=1500;
rectangular=1;
activationBy="WEST SEIZED";
repeating=1;
timeoutMin=60;
timeoutMax=60;
interruptable=1;
text="Seized by BLUFOR!";
expActiv="this = [""sector1"", ""BLUFOR""] execVM ""PMC\PMC_sector_seized.sqf"";";

position[]={2083.0864,212.15242,11280.326};
a=1500;
b=1500;
rectangular=1;
activationBy="GUER SEIZED";
repeating=1;
timeoutMin=60;
timeoutMax=60;
interruptable=1;
text="Seized by Independent!";
expActiv="this = [""sector1"", ""Independent""] execVM ""PMC\PMC_sector_seized.sqf"";";


	Sector - Markers

position[]={2083.0601,211.88358,11282.711};
name="sector1";
markerType="RECTANGLE";
type="Empty";
a=1500;
b=1500;

position[]={2083.3933,212.49199,11277.129};
name="sector1_text";
text="Sector 1";
type="mil_dot";


Sectors
Left Up: 2082, 11281
Right Up: 11145, 11288

Left Down: 2085, 2226
Right Down: 11147, 2219

*/
