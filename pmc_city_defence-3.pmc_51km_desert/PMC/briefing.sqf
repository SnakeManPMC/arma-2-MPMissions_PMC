waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["SERVICE AND SUPPORT","Friendly forces are approaching from east."]];

		player createDiaryRecord ["Diary",["ORDERS","1-1-A team <marker name='start'>start</marker> from city. Defend this city at all cost. Mission is accomplished when all enemies have been neutralized."]];

		player createDiaryRecord ["Diary",["INTEL","Enemy composition and strenght is unknown at this time, sorry. Expect heavy attack."]];

		player createDiaryRecord ["Diary",["GEN SITREP","Enemy forces are approaching from the west."]];

		player createDiaryRecord ["Diary",["Diary","This is one big goddamn city..."]];
	};

	case EAST:
	{
	};

	case RESISTANCE:
	{
	};

	case CIVILIAN:
	{
	};
};

/*
<a name = "OBJ_1'></marker>Capture building
<a name = "OBJ_2'></marker>Clear city
*/