// selects random starting location
PMC_SelectStartPosit =
{
	// select one starting point
	private ["_respawnpoint"];
	_respawnpoint = getPosASL (missionNamespace getVariable "PMC_blufor_veh");

	// location, returned from this function
	_respawnpoint
};
