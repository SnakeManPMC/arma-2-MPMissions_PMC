private
[
	"_PMC_VictoryCondition"
];

// globally how many units we allow on the mission (heh opfor + resistance)
_PMC_VictoryCondition = 1000;

switch (paramsarray select 3) do
{
	case 1:
	{
		_PMC_VictoryCondition = 50;
	};

	case 2:
	{
		_PMC_VictoryCondition = 100;
	};

	case 3:
	{
		_PMC_VictoryCondition = 150;
	};

	case 4:
	{
		_PMC_VictoryCondition = 200;
	};

	case 5:
	{
		_PMC_VictoryCondition = 300;
	};

	case 6:
	{
		_PMC_VictoryCondition = 400;
	};

	case 7:
	{
		_PMC_VictoryCondition = 500;
	};

	case 8:
	{
		_PMC_VictoryCondition = 600;
	};

	case 9:
	{
		_PMC_VictoryCondition = 700;
	};

	case 10:
	{
		_PMC_VictoryCondition = 800;
	};

	case 11:
	{
		_PMC_VictoryCondition = 900;
	};

	case 12:
	{
		_PMC_VictoryCondition = 1000;
	};

	case 13:
	{
		_PMC_VictoryCondition = 1500;
	};

	case 14:
	{
		_PMC_VictoryCondition = 2000;
	};

	case 15:
	{
		_PMC_VictoryCondition = 2500;
	};

	case 16:
	{
		_PMC_VictoryCondition = 3000;
	};

	case 17:
	{
		_PMC_VictoryCondition = 4000;
	};

	case 18:
	{
		_PMC_VictoryCondition = 5000;
	};

	case 19:
	{
		_PMC_VictoryCondition = 6000;
	};

	case 20:
	{
		_PMC_VictoryCondition = 7000;
	};

	case 21:
	{
		_PMC_VictoryCondition = 8000;
	};

	case 22:
	{
		_PMC_VictoryCondition = 9000;
	};

	case 23:
	{
		_PMC_VictoryCondition = 10000;
	};
};

_PMC_VictoryCondition
