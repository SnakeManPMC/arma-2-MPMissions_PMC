waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord
		[
			"Diary",
			[
				"Mission",
				"OPFOR <marker name='attack'>Attack</marker> is under way for <marker name='usa'>Marum</marker>. Defend it at all costs!"
			]
		];
		PMC_objective1 = player createSimpleTask ["Defend Marum"];
		PMC_objective1 setSimpleTaskDescription
		[
			"Defend <marker name='usa'>Marum</marker>",
			"Defend Marum",
			"Defend Marum"
		];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "usa");
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
