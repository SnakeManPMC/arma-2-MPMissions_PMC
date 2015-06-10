
hintSilent format
[
	"Units in map: %1\n\n
	BLUFOR: %2\n
	OPFOR: %3\n
	Tanks: %4\n
	Car: %5\n
	Air: %6\n
	Men: %7\n\n
	BLUFOR detected: %8\n
	OPFOR detected: %9\n\n\n
	Initial lists: %10\n\n
	Time Used:\n%11\n\n

	blufor tanks: %12\n
	blufor cars: %13\n
	blufor air: %14\n
	blufor man: %15\n\n

	opfor tanks: %16\n
	opfor cars: %17\n
	opfor air: %18\n
	opfor man: %19\n\n
	
	PMC_Corpses: %20, KIAs: %21\n",

	count (list pmc_opfor_list + list pmc_blufor_list),
	count list pmc_blufor_list,
	count list pmc_opfor_list,
	('tank' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	('car' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	('air' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	('man' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	PMC_blufor_detected,
	PMC_opfor_detected,
	PMC_initial_lists,
	call PMC_Time_Used_Update,
	
	('tank' countType list pmc_blufor_list),
	('car' countType list pmc_blufor_list),
	('air' countType list pmc_blufor_list),
	('man' countType list pmc_blufor_list),

	('tank' countType list pmc_opfor_list),
	('car' countType list pmc_opfor_list),
	('air' countType list pmc_opfor_list),
	('man' countType list pmc_opfor_list),
	
	count PMC_Corpses,
	PMC_KilledNum
];
