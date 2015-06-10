/*

	chooses few target locations for our array of objectives

Syntax:
PMC_MissionObjectives = call compile preprocessFileLineNumbers "PMC\PMC_Create_Mission_Targets.sqf";

Requires:
-

Returns:
array of target locations

*/
private
[
	"_a",
	"_myArray",
	"_myTarget",
	"_numTargets",
	"_tmpArray",
	"_pos_hq"
];

// how many targets to create
_numTargets = _this select 0;

// get HQ position which is our main target
_pos_hq = [0,0,0];
_myTarget = _pos_hq;
// the objectives array
_myArray = [];
_a = 0;
_tmpArray = PMC_CityCenters;

// create other targets
while { _a < _numTargets } do
{
	while { (_pos_hq distance _myTarget < 500) } do
	{
		_ran = floor (random count _tmpArray);
		_myTarget = (_tmpArray select _ran);
		_tmpArray = _tmpArray - [_myTarget];
	};

	// new target has been found and we place it on the objectives array
	_myArray = _myArray + [_myTarget];
	// return this guy into the HQ pos
	_pos_hq = _myTarget;
	_a = _a + 1;
};

// return it
_myArray
