
while {true} do
{
hintSilent format
[
	"Units in map: %1\n\n
	BLUFOR: %2\n
	OPFOR: %3\n\n

	Tanks: %4\n
	Car: %5\n
	Air: %6\n
	Man: %7\n\n

	blufor tanks: %8\n
	blufor cars: %9\n
	blufor plane: %10\n
	blufor helo: %11\n
	blufor man: %12\n\n

	opfor tanks: %13\n
	opfor cars: %14\n
	opfor plane: %15\n
	opfor helo: %16\n
	opfor man: %17\n\n
	
	landVehicles:\nBLUFOR: %18, OPFOR: %19\n\n

	Corpses: %20\n
	KIAs: %21",

	count (list pmc_opfor_list + list pmc_blufor_list),
	count list pmc_blufor_list,
	count list pmc_opfor_list,

	('tank' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	('car' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	('air' countType (list pmc_opfor_list + list pmc_blufor_list) ),
	('man' countType (list pmc_opfor_list + list pmc_blufor_list) ),

	('tank' countType list pmc_blufor_list),
	('car' countType list pmc_blufor_list),
	('plane' countType list pmc_blufor_list),
	('helicopter' countType list pmc_blufor_list),
	('man' countType list pmc_blufor_list),

	('tank' countType list pmc_opfor_list),
	('car' countType list pmc_opfor_list),
	('plane' countType list pmc_opfor_list),
	('helicopter' countType list pmc_opfor_list),
	('man' countType list pmc_opfor_list),

	('landVehicle' countType list pmc_blufor_list),
	('landVehicle' countType list pmc_opfor_list),
	
	count PMC_corpses,
	PMC_killedNum
];
sleep 2;
};
