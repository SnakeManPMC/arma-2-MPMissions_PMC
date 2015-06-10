
private
[
	"_PMC_MaxUnits"
];

// globally how many units we allow on the mission (heh opfor + resistance)
_PMC_MaxUnits = 200;

switch (paramsarray select 2) do
{
	case 1:
	{
		_PMC_MaxUnits = 50;
	};

	case 2:
	{
		_PMC_MaxUnits = 100;
	};

	case 3:
	{
		_PMC_MaxUnits = 150;
	};

	case 4:
	{
		_PMC_MaxUnits = 200;
	};

	case 5:
	{
		_PMC_MaxUnits = 250;
	};

	case 6:
	{
		_PMC_MaxUnits = 300;
	};

	case 7:
	{
		_PMC_MaxUnits = 350;
	};

	case 8:
	{
		_PMC_MaxUnits = 400;
	};

	case 9:
	{
		_PMC_MaxUnits = 450;
	};

	case 10:
	{
		_PMC_MaxUnits = 500;
	};

	case 11:
	{
		_PMC_MaxUnits = 550;
	};

	case 12:
	{
		_PMC_MaxUnits = 600;
	};

	case 13:
	{
		_PMC_MaxUnits = 650;
	};

	case 14:
	{
		_PMC_MaxUnits = 700;
	};

	case 15:
	{
		_PMC_MaxUnits = 750;
	};

	case 16:
	{
		_PMC_MaxUnits = 800;
	};

	case 17:
	{
		_PMC_MaxUnits = 850;
	};

	case 18:
	{
		_PMC_MaxUnits = 900;
	};

	case 19:
	{
		_PMC_MaxUnits = 950;
	};

	case 20:
	{
		_PMC_MaxUnits = 1000;
	};
};

_PMC_MaxUnits
