waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary",["SERVICE AND SUPPORT","Your support today is two AH-1 Cobra gunships, two UH-60 Blackhawks, two M1A1 Abrams platoons and several infantry squads. Medics are standing by also."]];

		player createDiaryRecord ["Diary",["ORDERS","1-1-A team <marker name='respawn_west'>start</marker> from city. Assault and capture <marker name='target1'>target building</marker> objective and clear our all enemies from the city.<br/><br/>Capture building and clear the city of enemy activity.<br/><br/>1-1-A team <marker name='respawn_west'>start</marker> from city. Assault and capture <marker name='target1'>target building</marker> objective and clear our all enemies from the city. Make sure after you have cleared the building that no enemy forces reach it. When you have the building, proceed to clear out remaining of the city, leave no enemies hiding in there. Mission is accomplished when all enemies have been neutralized."]];

		player createDiaryRecord ["Diary",["INTEL",""]];

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