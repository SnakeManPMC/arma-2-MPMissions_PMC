/*

	Logs crap to server side RPT file

[] execVM "PMC\PMC_Server_RPT_Logger.sqf";

*/
private
[
	"_list"
];

while {true} do
{
	// starting hash heh
	diag_log "##########################################################################";

	_list =
	format
	[
		"Units: %1, BLUFOR: %2, OPFOR: %3, Tanks: %4, Car: %5, Air: %6, Man: %7",

		count (list pmc_opfor_list + list pmc_blufor_list),
		count list pmc_blufor_list,
		count list pmc_opfor_list,

		('tank' countType (list pmc_opfor_list + list pmc_blufor_list) ),
		('car' countType (list pmc_opfor_list + list pmc_blufor_list) ),
		('air' countType (list pmc_opfor_list + list pmc_blufor_list) ),
		('man' countType (list pmc_opfor_list + list pmc_blufor_list) )
	];

	diag_log _list;

	_list =
	format
	[
		"BLUFOR Tanks: %1, Cars: %2, Plane: %3, Helo: %4, Man: %5",

		('tank' countType list pmc_blufor_list),
		('car' countType list pmc_blufor_list),
		('plane' countType list pmc_blufor_list),
		('helicopter' countType list pmc_blufor_list),
		('man' countType list pmc_blufor_list)
	];		

	diag_log _list;

	_list =
	format
	[
		"OPFOR  Tanks: %1, Cars: %2, Plane: %3, Helo: %4, Man: %5",
		
		('tank' countType list pmc_opfor_list),
		('car' countType list pmc_opfor_list),
		('plane' countType list pmc_opfor_list),
		('helicopter' countType list pmc_opfor_list),
		('man' countType list pmc_opfor_list)
	];

	diag_log _list;

	_list =
	format
	[		
		"landVehicles: BLUFOR: %1, OPFOR: %2, Corpses: %3, KIAs: %4, FPS: %5",
	
		('landVehicle' countType list pmc_blufor_list),
		('landVehicle' countType list pmc_opfor_list),
		
		count PMC_corpses,
		PMC_killedNum,
		diag_fps
	];

	diag_log _list;

	// ending hash heh
	diag_log "##########################################################################";
	
	// wait two minutes
	sleep 120;
};

//2013/04/28,  6:21:45 "##########################################################################"
//2013/04/28,  6:21:45 "Units: 301, BLUFOR: 180, OPFOR: 121, Tanks: 20, Car: 43, Air: 2, Man: 236"
//2013/04/28,  6:21:45 "BLUFOR Tanks: 20, Cars: 31, Plane: 1, Helo: 1, Man: 127"
//2013/04/28,  6:21:45 "OPFOR  Tanks: 0, Cars: 12, Plane: 0, Helo: 0, Man: 109"
//2013/04/28,  6:21:45 "landVehicles: BLUFOR: 51, OPFOR: 12, Corpses: 100, KIAs: 3492, FPS: 13.5364"
//2013/04/28,  6:21:45 "##########################################################################"
