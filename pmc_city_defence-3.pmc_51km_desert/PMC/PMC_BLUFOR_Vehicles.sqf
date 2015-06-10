/*

	PMC OPFOR vehicles creation

*/

private ["_grp","_respawnpoint","_targetpoint","_PMC_SelectStartPosit"];

call compile preprocessFileLineNumbers "PMC\PMC_CreateConvoyVehicles.sqf";
call compile preprocessFileLineNumbers "PMC\PMC_SelectStartPosit.sqf";

while {true} do
{
	// choose one of the random starting locations
	_respawnpoint = [] call PMC_SelectStartPosit;
	_targetpoint = getPosASL (missionNamespace getVariable "racsflag");

	_grp = [_respawnpoint, _targetpoint] call PMC_CreateConvoyVehicles;

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
	// and then we start the whole damn loop all over again :)
};
