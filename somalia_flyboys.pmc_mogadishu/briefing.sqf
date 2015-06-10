waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary", ["Mission", "Air teams <marker name='start'>start</marker> from airbase. Clear <marker name='target1'>harbor</marker>, secure <marker name='target2'>Olympic Hotel</marker> and clear <marker name='target3'>Stadium</marker> objectives."]];
		player createDiaryRecord ["Diary", ["Notes", "Three objectives to clear."]];

		PMC_objective3 = player createSimpleTask ["Clear Stadium"];
		PMC_objective3 setSimpleTaskDescription ["Clear Stadium", "Clear Stadium", "Clear Stadium"];
		PMC_objective3 setSimpleTaskDestination (getMarkerPos "target3");

		PMC_objective2 = player createSimpleTask ["Secure Olympic Hotel"];
		PMC_objective2 setSimpleTaskDescription ["Secure Olympic Hotel", "Secure Olympic Hotel", "Secure Olympic Hotel"];
		PMC_objective2 setSimpleTaskDestination (getMarkerPos "target2");

		PMC_objective1 = player createSimpleTask ["Clear harbor"];
		PMC_objective1 setSimpleTaskDescription ["Clear harbor", "Clear harbor", "Clear harbor"];
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

