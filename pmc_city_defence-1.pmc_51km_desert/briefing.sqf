waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["SERVICE AND SUPPORT","n/a"]];

		player createDiaryRecord ["Diary",["ORDERS","1-1-A team <marker name='start'>start</marker> from city. Defend this city at all cost. Mission is accomplished when all enemies have been neutralized."]];

		player createDiaryRecord ["Diary",["INTEL","n/a"]];

		player createDiaryRecord ["Diary",["GEN SITREP","Enemy forces have placed alot of troops and vehicles into the capitol city, our objectives are to clear them out at any cost."]];

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