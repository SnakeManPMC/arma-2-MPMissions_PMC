
private
[
	"_MaxCorpses",
	"_first"
];

_MaxCorpses = _this select 0;

while {true} do
{
	// wait until our corpses list gets higher than specified number
	waitUntil
	{
		sleep 2;
		(count PMC_corpses > _MaxCorpses);
	};

	// then delete the oldest corpse and start again.
	_first = PMC_corpses select 0;
	deleteVehicle _first;
	PMC_corpses set [0,"DELETEME"];
	PMC_corpses = PMC_corpses - ["DELETEME"];
	publicVariable "PMC_corpses";
};
