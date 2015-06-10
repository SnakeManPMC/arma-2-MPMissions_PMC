waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord 
		["Diary", ["Mission","1-1-A team <marker name='start'>start</marker> from the street. Reach <marker name='target1'>target building</marker> objective and clear all tangos."]];
		["Notes", ["Checking the buildings."]];
		PMC_objective1 = player createSimpleTask ["Reach target building and clear tangos"];
		PMC_objective1 setSimpleTaskDescription ["Reach <marker name='target1'>target building</marker> objective and clear all tangos","Reach target building and clear tangos","Reach target building and clear tangos"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target1");
		player setCurrentTask PMC_objective1;
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
