/*

	FOB/FARP/LZ setting up using publiceventhandler.

Syntax:
PMC_Setup_My_FOB = getPosASL player;
publicVariable "PMC_Setup_My_FOB";

Requires:
PMC\PMC_Choose_FOB_Location.sqf
PMC\PMC_Setup_FOB.sqf

Returns:
-

*/

"PMC_Setup_My_FOB" addPublicVariableEventhandler
{
	[(_this select 1)] execVM "PMC\PMC_Setup_FOB.sqf";

	diag_log format["PMC_Setup_My_FOB (eventhandler): %1 / %2", (_this select 0), (_this select 1)];
};


"PMC_Strike_Team_Target" addPublicVariableEventhandler
{
	[(_this select 1), (getMarkerPos "respawn_west")] execVM "PMC\PMC_Strike_Team_Target.sqf";

	diag_log format["PMC_Strike_Team_Target (eventhandler): %1 / %2", (_this select 0), (_this select 1)];
};


"PMC_Airstrike_Target" addPublicVariableEventhandler
{
	[(_this select 1), (getMarkerPos "respawn_west")] execVM "PMC\PMC_Airstrike_Target.sqf";

	diag_log format["PMC_Airtstrike_Target (eventhandler): %1 / %2", (_this select 0), (_this select 1)];
};


"PMC_Hint" addPublicVariableEventHandler
{
	hint format["%1", (_this select 1)];
};
