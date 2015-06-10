
private
[
	"_direction",
	"_distance",
	"_grp",
	"_respawnpoint"
];

_direction = random 360;
_distance = (500 + random 1000);
_respawnpoint = [((PMC_crash_site_location select 0)  + (_distance * sin _direction)), ((PMC_crash_site_location select 1) + (_distance * cos _direction)), 0];

_grp = objNull;
_grp = createGroup east;
waitUntil {!(isNull _grp)};

"GUE_Soldier_CO" createUnit [_respawnpoint, _grp, "", 0.2, "SERGEANT"];
"GUE_Soldier_GL" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
"GUE_Soldier_AR" createUnit [_respawnpoint, _grp, "", 1, "CORPORAL"];
"GUE_Soldier_1" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
"GUE_Soldier_3" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];
"GUE_Soldier_2" createUnit [_respawnpoint, _grp, "", 0.2, "CORPORAL"];

_grp setbehaviour "AWARE";
_grp setcombatmode "RED";
_grp setspeedmode "FULL";
_grp setformation "WEDGE";

_grp addWaypoint [PMC_crash_site_location, 200];
[_grp, 1] setWaypointBehaviour "AWARE";
[_grp, 1] setWaypointCombatMode "RED";
[_grp, 1] setWaypointSpeed "FULL";
[_grp, 1] setWaypointFormation "WEDGE";
[_grp, 1] setWaypointType "SAD";
[_grp, 1] setWaypointCompletionRadius 50;

_grp addWaypoint [PMC_crash_site_location, 200];
[_grp, 2] setWaypointType "SAD";
[_grp, 2] setWaypointCompletionRadius 50;

_grp addWaypoint [PMC_crash_site_location, 200];
[_grp, 3] setWaypointType "SAD";
[_grp, 3] setWaypointCompletionRadius 50;

_grp addWaypoint [PMC_crash_site_location, 200];
[_grp, 4] setWaypointType "SAD";
[_grp, 4] setWaypointCompletionRadius 50;

_grp addWaypoint [PMC_crash_site_location, 100];
[_grp, 5] setWaypointType "CYCLE";
[_grp, 5] setWaypointCompletionRadius 50;

//player sideChat format["you distance crash site: %1, you distance insurgents: %2", (player distance PMC_crash_site_location), (player distance leader _grp)];
