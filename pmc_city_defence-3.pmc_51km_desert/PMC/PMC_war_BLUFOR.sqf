/*

	BLUFOR war script

*/

private ["_grp","_waypointRanPosit","_respawnpoint","_targetpoint"];

call compile preprocessFileLineNumbers "PMC\PMC_MakeSpecOpsBLUFOR.sqf";

_waypointRanPosit = 25;
_respawnpoint = getPosASL (missionNamespace getVariable "PMC_blufor_helostart");
_targetpoint = getPosASL (missionNamespace getVariable "racsflag");

while {true} do
{
	_grp = [_respawnpoint, _targetpoint, _waypointRanPosit] call PMC_MakeSpecOpsBLUFOR;

	sleep 10;
	// we wait until the convoy group is completely dead.
	waitUntil
	{
		sleep 10;
		((count units _grp) == 0);
	};
	// then we delete its group.
	waitUntil
	{
		deleteGroup _grp;
		(isNull _grp);
	};
};
