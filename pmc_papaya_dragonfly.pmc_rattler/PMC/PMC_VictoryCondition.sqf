/*
	class PMC_VictoryCondition
	{
		title = "OPFOR strenght (comes in waves, no more than 100 at the time)";
		values[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20};
		texts[] = {"50", "100", "150", "200", "250", "300", "400", "500", "600", "700", "800", "900", "1000", "1500", "2000", "3000", "4000", "5000", "8000", "10000"};
		default = 6;
	};
*/

switch (paramsarray select 2) do
{
	case 1:
	{
		PMC_VictoryCondition = 50;
	};
	
	case 2:
	{
		PMC_VictoryCondition = 100;
	};

	case 3:
	{
		PMC_VictoryCondition = 150;
	};

	case 4:
	{
		PMC_VictoryCondition = 200;
	};

	case 5:
	{
		PMC_VictoryCondition = 250;
	};

	case 6:
	{
		PMC_VictoryCondition = 300;
	};

	case 7:
	{
		PMC_VictoryCondition = 400;
	};

	case 8:
	{
		PMC_VictoryCondition = 500;
	};

	case 9:
	{
		PMC_VictoryCondition = 600;
	};

	case 10:
	{
		PMC_VictoryCondition = 700;
	};

	case 11:
	{
		PMC_VictoryCondition = 800;
	};

	case 12:
	{
		PMC_VictoryCondition = 900;
	};

	case 13:
	{
		PMC_VictoryCondition = 1000;
	};

	case 14:
	{
		PMC_VictoryCondition = 1500;
	};

	case 15:
	{
		PMC_VictoryCondition = 2000;
	};

	case 16:
	{
		PMC_VictoryCondition = 3000;
	};

	case 17:
	{
		PMC_VictoryCondition = 4000;
	};

	case 18:
	{
		PMC_VictoryCondition = 5000;
	};

	case 19:
	{
		PMC_VictoryCondition = 8000;
	};

	case 20:
	{
		PMC_VictoryCondition = 10000;
	};
};
