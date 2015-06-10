/*

	Call Strike Team from action menu, local to single player selecting it

Syntax:
-
	
Requires:
"PMC_Strike_Team_Target" addPublicVariableEventhandler

Returns:
-

*/

hint "Click on MAP to choose target location.";

onMapSingleClick
{
	// this makes it underground like -12 meters hehe?
	PMC_Strike_Team_Target = _pos;
	publicVariable "PMC_Strike_Team_Target";
	onMapSingleClick {};
	true;
};
