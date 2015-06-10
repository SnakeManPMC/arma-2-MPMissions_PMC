/*

	Create FOB from action menu, local to single player selecting it

Syntax:
-
	
Requires:
"PMC_Setup_My_FOB" addPublicVariableEventhandler
PMC\PMC_Setup_FOB.sqf

Returns:
-

*/

hint "Click on MAP to choose FOB location.\n\nTry to place it on open ground at least 200m away from objects.\n\nPlease don't abuse this, use smartly.";

onMapSingleClick
{
	// this makes it underground like -12 meters hehe?
	PMC_Setup_My_FOB = _pos;
	publicVariable "PMC_Setup_My_FOB";
	onMapSingleClick {};
	true;
};

/*
PMC_Setup_My_FOB = (getPosASL player);
publicVariable "PMC_Setup_My_FOB";
"respawn_west" setMarkerPosLocal (getPosASL player);
*/
