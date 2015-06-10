/*

BUG: DOESNT WORK BECAUSE YOU HAVE NO GAMELOGIC "GROUP" or something...

createst gamelogics for list of locations in mission.sqm position[] array style

*/
private
[
	"_a",
	"_array",
	"_logicName",
	"_pos"
];

_array = _this select 0;
_a = 1;

{
	// create correct format position
	//_pos = [(_x select 0), (_x select 2), 0];

	// increment out naming scheme and create a GameLogic
	_logicName = format["pmc_%1", _a];
	"Logic" createUnit [_logicName, _x, [], 0, "NONE"];
	//createUnit ["GarbageCollector", position player, [], 0, "NONE"]
	_a = _a + 1;
} forEach _array;
