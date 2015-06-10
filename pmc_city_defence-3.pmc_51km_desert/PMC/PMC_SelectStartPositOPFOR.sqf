
// selects random starting location
PMC_SelectStartPositOPFOR =
{
	private["_respawnpoint"];
	// select one starting point
	_respawnpoint = getPosASL (missionNamespace getVariable "PMC_opfor_veh");

	// location, returned from this function
	_respawnpoint
};
