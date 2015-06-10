waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary", ["Mission", "1-1-A team <marker name='start'>start</marker> from traffic. Reach <marker name='target1'>target building</marker> objective with your convoy."]];
		player createDiaryRecord ["Diary", ["Notes", "This is going to be nasty trip."]];
		player createDiaryRecord ["Diary", ["Situation", "The rebels are on high alert in Mogadishu today."]];
		player createDiaryRecord ["Diary", ["Mission2", "Urgent convoy must reach the target building."]];
		player createDiaryRecord ["Diary", ["Execution", "1-1-A team <marker name='start'>start</marker> from traffic. Travel through the roads marked on blue dots and reach <marker name='target1'>target building</marker> objective near Olympic Hotel. Be prepared to defend your convoy but watch out for civilians."]];
		player createDiaryRecord ["Diary", ["Service and Support", "No support today."]];
		player createDiaryRecord ["Diary", ["Command and Signal", "None."]];
		player createDiaryRecord ["Diary", ["Mission design", "PMC Mogadishu Convoy by Snake Man.<br/>Lead a convoy through Mogadisu into Olympic Hotel."]];
		PMC_objective1 = player createSimpleTask ["Reach target building"];
		PMC_objective1 setSimpleTaskDescription ["Reach <marker name='target1'>target building</marker> objective.", "Reach target building", "Reach target building"];
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

