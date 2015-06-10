waitUntil {!(isNull player)};
waitUntil {player == player};

switch (side player) do
{
	case WEST:
	{
		player createDiaryRecord ["Diary", ["Mission", "1-1-A team <marker name='start'>start</marker> from base. Patrol each of the assigned zones, then return to base."]];
		player createDiaryRecord ["Diary", ["Notes", "Patrol of the big Mog."]];

		PMC_objective1 = player createSimpleTask ["Return to base"];
		PMC_objective1 setSimpleTaskDescription ["Return to <marker name='start'>base</marker>", "RTB", "RTB"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "start");

		PMC_objective1 = player createSimpleTask ["Patrol area 17"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target17'>area 17</marker>", "Patrol area 17", "Patrol area 17"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target17");

		PMC_objective1 = player createSimpleTask ["Patrol area 16"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target16'>area 16</marker>", "Patrol area 16", "Patrol area 16"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target16");

		PMC_objective1 = player createSimpleTask ["Patrol area 15"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target15'>area 15</marker>", "Patrol area 15", "Patrol area 15"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target15");

		PMC_objective1 = player createSimpleTask ["Patrol area 14"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target14'>area 14</marker>", "Patrol area 14", "Patrol area 14"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target14");

		PMC_objective1 = player createSimpleTask ["Patrol area 13"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target13'>area 13</marker>", "Patrol area 13", "Patrol area 13"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target13");

		PMC_objective1 = player createSimpleTask ["Patrol area 12"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target12'>area 12</marker>", "Patrol area 12", "Patrol area 12"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target12");

		PMC_objective1 = player createSimpleTask ["Patrol area 11"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target11'>area 11</marker>", "Patrol area 11", "Patrol area 11"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target11");

		PMC_objective1 = player createSimpleTask ["Patrol area 10"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target10'>area 10</marker>", "Patrol area 10", "Patrol area 10"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target10");

		PMC_objective1 = player createSimpleTask ["Patrol area 9"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target9'>area 9</marker>", "Patrol area 9", "Patrol area 9"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target9");

		PMC_objective1 = player createSimpleTask ["Patrol area 8"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target8'>area 8</marker>", "Patrol area 8", "Patrol area 8"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target8");

		PMC_objective1 = player createSimpleTask ["Patrol area 7"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target7'>area 7</marker>", "Patrol area 7", "Patrol area 7"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target7");

		PMC_objective1 = player createSimpleTask ["Patrol area 6"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target6'>area 6</marker>", "Patrol area 6", "Patrol area 6"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target6");

		PMC_objective1 = player createSimpleTask ["Patrol area 5"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target5'>area 5</marker>", "Patrol area 5", "Patrol area 5"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target5");

		PMC_objective1 = player createSimpleTask ["Patrol area 4"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target4'>area 4</marker>", "Patrol area 4", "Patrol area 4"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target4");

		PMC_objective1 = player createSimpleTask ["Patrol area 3"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target3'>area 3</marker>", "Patrol area 3", "Patrol area 3"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target3");

		PMC_objective1 = player createSimpleTask ["Patrol area 2"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target2'>area 2</marker>", "Patrol area 2", "Patrol area 2"];
		PMC_objective1 setSimpleTaskDestination (getMarkerPos "target2");

		PMC_objective1 = player createSimpleTask ["Patrol area 1"];
		PMC_objective1 setSimpleTaskDescription ["Patrol <marker name='target1'>area 1</marker>", "Patrol area 1", "Patrol area 1"];
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

