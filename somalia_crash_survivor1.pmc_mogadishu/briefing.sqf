waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary", ["Mission", "Your helo has just crashed, pilot and crew killed, your squad survived. Enemy is closing in, will you survive them?"]];
		player createDiaryRecord ["Diary", ["Notes", "Crash and burn!"]];
		PMC_objective1 = player createSimpleTask ["Repel the enemy attack!"];
		PMC_objective1 setSimpleTaskDescription ["Repel the enemy attack!", "Repel the enemy attack!", "Repel the enemy attack!"];
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

