
private
[
	"_grp",
	"_ran",
	"_Max_OPFOR_On_Map",
	"_respawnpoint",
	"_sleeptime",
	"_targetpoint",
	"_victoryCondition"
];

// how many enemies to create
// ArmA 2 group limit per side is 144 ?
// 500 / 10 = 50 groups.
// 1400 / 10 = 140 groups.
_victoryCondition = 300;

// maximum number of opfor on the map at one time
_Max_OPFOR_On_Map = 100;

// random sleep time
_sleeptime = (5 + random 2);

// PMC_SelectStartPosit starting position selecting function
call compile preProcessFileLineNumbers "PMC\PMC_SelectStartPosit.sqf";

// PMC_Select_Target
call compile preProcessFileLineNumbers "PMC\PMC_Select_Target.sqf";

// PMC_Create_Insurgent_Group
call compile preProcessFileLineNumbers "PMC\PMC_Create_Insurgent_Group.sqf";

// PMC_Create_Insurgent_Weapons_Group
call compile preProcessFileLineNumbers "PMC\PMC_Create_Insurgent_Weapons_Group.sqf";

// PMC_Create_Insurgent_Militia
call compile preProcessFileLineNumbers "PMC\PMC_Create_Insurgent_Militia.sqf";

// wait until mission starts and pmc_opforunits trigger is usable.
waitUntil
{
	(count (list pmc_opforunits) > 0);
};

while {PMC_opfor < _victoryCondition} do
{
	if ((EAST countSide (list pmc_opforunits)) < _Max_OPFOR_On_Map) then
	{
		// random starting location
		_respawnpoint = ["OPFOR"] call PMC_SelectStartPosit;

		_ran = 3;
		_ran = round (random 3);
		switch (_ran) do
		{
			case 0:
			{
				_grp = [_respawnpoint] call PMC_Create_Insurgent_Group;
//				player sidechat format["created Insurgent_Group. pmc_opfor: %1, pmc_opforunits: %2", pmc_opfor, EAST countSide (list pmc_opforunits)];
			};

			case 1:
			{
				_grp = [_respawnpoint] call PMC_Create_Insurgent_Weapons_Group;
//				player sidechat format["created Insurgent_Weapons_Group. pmc_opfor: %1, pmc_opforunits: %2", pmc_opfor, EAST countSide (list pmc_opforunits)];
			};

			case 2:
			{
				_grp = [_respawnpoint] call PMC_Create_Insurgent_Militia;
//				player sidechat format["created Insurgent_Militia. pmc_opfor: %1, pmc_opforunits: %2", pmc_opfor, EAST countSide (list pmc_opforunits)];
			};
		};

		// add one group created.
		PMC_grp_opfor = PMC_grp_opfor + 1;
		publicVariable "PMC_grp_opfor";

		// select target
		_targetpoint = call PMC_Select_Target;

		{
			_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
		} foreach units _grp;

		_grp setbehaviour "AWARE";
		_grp setcombatmode "RED";
		_grp setspeedmode "FULL";
		_grp setformation "WEDGE";

		// waypoints, we add couple to make patrol area
		// first
		_grp addWaypoint [_targetpoint, 200];
		[_grp, 1] setWaypointBehaviour "AWARE";
		[_grp, 1] setWaypointCombatMode "RED";
		[_grp, 1] setWaypointSpeed "FULL";
		[_grp, 1] setWaypointFormation "WEDGE";
		[_grp, 1] setWaypointType "SAD";

		// cycle
		_grp addWaypoint [_targetpoint, 200];
		[_grp, 2] setWaypointType "GUARD";

		// add our created enemies
		PMC_opfor = PMC_opfor + 10;
		publicVariable "PMC_opfor";
	};
	sleep _sleeptime;
//	player sidechat format["Looping with pmc_opfor: %1, pmc_opforunits: %2", pmc_opfor, EAST countSide (list pmc_opforunits)];
};

// small wait
sleep 60;

// when enemy count drops below value, end mission!
waitUntil
{
	sleep 5;
	((EAST countSide (list pmc_opforunits)) < 20);
};

// log uah ;)
diag_log "PMC MISSION OBJECTIVES COMPLETED! pmc_opforunits < 20";

// small delay that mission wont end immediately after last guy dies
sleep 5;

// declare mission over.
PMC_mcomplete = true;
publicVariable "PMC_mcomplete";
