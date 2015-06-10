waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary", ["Mission","Delta Force team <marker name='target1'>located near Olympic Hotel</marker> is in trouble. Reach them quickly."]];
		PMC_objective1 = player createSimpleTask ["Reach Delta Force team"];
		PMC_objective1 setSimpleTaskDescription ["Reach <marker name='target1'>Delta Force team</marker> objective", "Reach Deltas", "Reach Deltas"];
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
