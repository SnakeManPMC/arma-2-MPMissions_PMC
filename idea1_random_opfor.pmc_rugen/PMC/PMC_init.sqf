
private
[
	"_tmp"
];

// description.ext mission starting parameters
skiptime (((paramsarray select 0) - daytime + 24) % 24);

// set our weather using multiplayer parameter array
[] execVM "PMC\PMC_weather_with_mp_parameter.sqf";

PMC_corpses = [];
[150] execVM "PMC\PMC_corpses.sqf";
PMC_killedNum = 0;

[] execVM "PMC\PMC_targets.sqf";
waitUntil { count PMC_targets > 0 };
[] execVM "PMC\PMC_unit_arrays.sqf";
[] execVM "PMC\PMC_opfor.sqf";
