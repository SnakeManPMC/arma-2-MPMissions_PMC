/*

	Call Airstrike from action menu, local to single player selecting it

Syntax:
-
	
Requires:
"PMC_Airstrike_Target" addPublicVariableEventhandler

Returns:
-

*/

hint "Click on MAP to choose target location.";

onMapSingleClick
{
	// this makes it underground like -12 meters hehe?
	PMC_Airstrike_Target = _pos;
	publicVariable "PMC_Airstrike_Target";
	onMapSingleClick {};
	true;
};
