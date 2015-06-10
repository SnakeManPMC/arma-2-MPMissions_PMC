
private
[
	"_z"
];

_z = createTrigger ["EmptyDetector", [100, 100]];
_z setTriggerActivation ["DELTA", "PRESENT", true];
_z setTriggerArea [0, 0, 0, true];
_z setTriggerTimeout [0, 0, 0, false];
_z setTriggerText "Weather Forecast";
_z setTriggerStatements ["this", "this = [] execVM 'PMC\PMC_weather_forecast.sqf';", ""];
