/*

	Mission Objectives, tasks are set when objective is completed

*/

// just a check to make sure our arrays are filled
waitUntil
{
	sleep 1;
	( (count PMC_vips > 0) && (count PMC_scuds > 0) );
};

if (PMC_debug) then
{
	diag_log format["PMC_mission_objectives start, PMC_vips: %1, PMC_scuds: %2", count PMC_vips, count PMC_scuds];
};

private["_PMC_vip_1_dead", "_PMC_vip_2_dead", "_PMC_vip_3_dead", "_PMC_vip_4_dead", "_PMC_vip_5_dead", "_PMC_scud_1_dead", "_PMC_scud_2_dead", "_PMC_scud_3_dead", "_PMC_scud_4_dead", "_PMC_scud_5_dead"];

_PMC_vip_1_dead = false;
_PMC_vip_2_dead = false;
_PMC_vip_3_dead = false;
_PMC_vip_4_dead = false;
_PMC_vip_5_dead = false;
_PMC_scud_1_dead = false;
_PMC_scud_2_dead = false;
_PMC_scud_3_dead = false;
_PMC_scud_4_dead = false;
_PMC_scud_5_dead = false;

// slow loop to go through completed objectives
while { true } do
{
	// 30 sec wait, hardcoded, we are in no hurry.
	sleep 30;
	
	// VIP hunt

	// VIP 1
	if ( !alive (PMC_vips select 0) && !_PMC_vip_1_dead ) then
	{
		_PMC_vip_1_dead = true;
		["PMC_objective1", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// VIP 2
	if ( !alive (PMC_vips select 1) && !_PMC_vip_2_dead ) then
	{
		_PMC_vip_2_dead = true;
		["PMC_objective2", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// VIP 3
	if ( !alive (PMC_vips select 2) && !_PMC_vip_3_dead ) then
	{
		_PMC_vip_3_dead = true;
		["PMC_objective3", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// VIP 4
	if ( !alive (PMC_vips select 3) && !_PMC_vip_4_dead ) then
	{
		_PMC_vip_4_dead = true;
		["PMC_objective4", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// VIP 5
	if ( !alive (PMC_vips select 4) && !_PMC_vip_5_dead ) then
	{
		_PMC_vip_5_dead = true;
		["PMC_objective5", "succeeded"] call SHK_Taskmaster_Upd;
	};


	// then SCUD hunt

	// PMC_scuds is array of GROUPS

	// SCUD 1
	if ( (count units (PMC_scuds select 0) == 0) && !_PMC_scud_1_dead ) then
	{
		_PMC_scud_1_dead = true;
		["PMC_objective6", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// SCUD 2
	if ( (count units (PMC_scuds select 1) == 0) && !_PMC_scud_2_dead ) then
	{
		_PMC_scud_2_dead = true;
		["PMC_objective7", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// SCUD 3
	if ( (count units (PMC_scuds select 2) == 0) && !_PMC_scud_3_dead ) then
	{
		_PMC_scud_3_dead = true;
		["PMC_objective8", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// SCUD 4
	if ( (count units (PMC_scuds select 3) == 0) && !_PMC_scud_4_dead ) then
	{
		_PMC_scud_4_dead = true;
		["PMC_objective9", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// SCUD 5
	if ( (count units (PMC_scuds select 4) == 0) && !_PMC_scud_5_dead ) then
	{
		_PMC_scud_5_dead = true;
		["PMC_objective10", "succeeded"] call SHK_Taskmaster_Upd;
	};

	// all objectives complete, exit loop
	if (_PMC_vip_1_dead && _PMC_vip_2_dead && _PMC_vip_3_dead && _PMC_vip_4_dead && _PMC_vip_5_dead && _PMC_scud_1_dead && _PMC_scud_2_dead && _PMC_scud_3_dead && _PMC_scud_4_dead && _PMC_scud_5_dead) exitWith
	{
		PMC_mcomplete = true;
		publicVariable "PMC_mcomplete";
		diag_log "*****\nPMC_mcomplete is true! All objectives completed! Mission is over!\n******";
	};

	//diag_log format["PMC_mission_objectives loop, _PMC_vip_1_dead: %1, _PMC_vip_2_dead: %2, _PMC_vip_3_dead: %3, _PMC_vip_4_dead: %4, _PMC_vip_5_dead: %5, _PMC_scud_1_dead: %6, _PMC_scud_2_dead: %7, _PMC_scud_3_dead: %8, _PMC_scud_4_dead: %9, _PMC_scud_5_dead: %10",
	//_PMC_vip_1_dead, _PMC_vip_2_dead, _PMC_vip_3_dead, _PMC_vip_4_dead, _PMC_vip_5_dead, _PMC_scud_1_dead, _PMC_scud_2_dead, _PMC_scud_3_dead, _PMC_scud_4_dead, _PMC_scud_5_dead];
};
