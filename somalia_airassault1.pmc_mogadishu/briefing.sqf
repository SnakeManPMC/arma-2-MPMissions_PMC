waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord 
		["Diary", ["Mission","1-1-A team <marker name='start'>start</marker> from base. Reach <marker name='target1'>target building</marker> objective, enter the building and then return to base."]];
		["Notes", ["Assault and then back to base, easy."]];
		PMC_objective1 = player createSimpleTask ["Reach target building"];
		PMC_objective1 setSimpleTaskDescription ["Reach <marker name='target1'>target building</marker> objective","Reach target building","Reach target building"];
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
