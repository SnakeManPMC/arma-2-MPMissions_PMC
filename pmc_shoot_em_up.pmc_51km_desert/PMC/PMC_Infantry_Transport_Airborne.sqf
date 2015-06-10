/*

	(Helicopter) Infantry Transport Airborne

Syntax:
[group, startPos, targetPos] execVM "PMC\PMC_Infantry_Transport_Airborne.sqf";

Requires:
PMC\PMC_groupRecycle.sqf	- for group removal.
PMC\PMC_killed.sqf		- for dead body removal.
PMC\PMC_Create_Crew.sqf		- for creating the crew

*/

private
[
	"_grp",
	"_HeloGrp",
	"_rtb",
	"_landingzone",
	"_vcl"
];

_grp = _this select 0;
_rtb = getPosASL (_this select 1);
_landingzone = getPosASL (_this select 2);

// starting location randomizer
_rtb = [((_rtb select 0) + random 200),((_rtb select 1) + random 200),200];

// we increment our count for transports active.
PMC_InfTransport = PMC_InfTransport + 1;
publicVariable "PMC_InfTransport";

_vcl = objNull;
_HeloGrp = objNull;
_HeloGrp = createGroup (west);
waitUntil
{
	!(isNull _HeloGrp);
};
// create ArmA 2 UH-60 Blackhawk and basic US pilot
_vcl = createVehicle ["UH60M_EP1", _rtb, [], 0, "FLY"];
//_vcl = "MH60S" createVehicle _rtb;
"US_Soldier_Pilot_EP1" createUnit [_rtb, _HeloGrp, "", 1, "SERGEANT"];

// fly higher because in chernarus its coming very close to crashing into trees and objects.
_vcl flyInHeight 75;

// blufor usmc helo, pilot
// MH60S, USMC_Soldier_Pilot
// blufor us helo, pilot
// UH60M_EP1, US_Soldier_Pilot_EP1

diag_log format ["Infantry_Transport_Airborne start with vehicle: %1, _grp: %2", _vcl, _HeloGrp];
(units _HeloGrp select 0) moveInDriver _vcl;
// create crew
[_vcl, _HeloGrp] execVM "PMC\PMC_Create_Crew.sqf";
{
	_x addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];
} forEach units _HeloGrp;
_vcl addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

[_HeloGrp] execVM "PMC\PMC_groupRecycle.sqf";

// load our guys
{
	_x assignAsCargo _vcl;
	_x moveInCargo _vcl;
} forEach units _grp;

_HeloGrp setBehaviour "AWARE";
_HeloGrp setCombatMode "YELLOW";
_HeloGrp setSpeedMode "FULL";
_HeloGrp setFormation "WEDGE";

// order him to move into LZ
_vcl move _landingzone;

// small wait
sleep 3;

// some radio traffic, lifting off into the mission.
leader _HeloGrp sideChat format["This is %1, cargo group %2 onboard, we are lifting off now. Over.", leader _HeloGrp, _grp];

// plotwaypoints stuff
_tmp = [_vcl, _landingzone] execVM "PMC\PMC_plotWaypoints_Holding_Hands.sqf";
waitUntil { (scriptDone _tmp); };

// add this beeyaatch!
//[_HeloGrp, 1] setWaypointStatements ["true", "{unassignVehicle _x; [_x] orderGetIn false} forEach (assignedCargo vehicle (thislist select 0))"];

// lets wait until he is ready or within 300m of the LZ, or helo cant move.
waitUntil
{
	sleep 2;
	( ( (unitReady _vcl) || (_vcl distance _landingzone) < 200) || !(canMove _vcl) );
};

diag_log format ["Infantry Transport Airborne %1, approach check. unitReady: %2, LZ dist: %3, canMove %4", _HeloGrp, unitReady _vcl, (_vcl distance _landingzone), canMove _vcl];

// death check, if helo or crew is dead, just exit this script.
if (!alive _vcl || !alive leader _HeloGrp) exitWith
{
	// we decrease our count for transports active.
	PMC_InfTransport = PMC_InfTransport - 1;
	publicVariable "PMC_InfTransport";
	diag_log format ["Infantry Transport Airborne %1 has exited with catastrophic failure. alive _vcl: %2, alive leader _HeloGrp: %3, posit: %4", _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl];
};

// helo vehicle and the group leader is alive, put some radio traffic.
if ((alive leader _HeloGrp) && (canMove _vcl)) then
{
	leader _HeloGrp sideChat format["%1 reporting. Setting her down now, disembarking cargo. Over.", leader _HeloGrp];
};

// dumb the cargo out
{
	unassignVehicle _x;
} forEach units _grp;

// little breathing room for landing...
sleep 5;

// order him to move back into HQ
_vcl move _rtb;

// small wait
sleep 3;

// lets wait until his within 100m of HQ, or helo is dead.
waitUntil
{
	sleep 2;
	( ( (unitReady _vcl) || (_vcl distance _rtb) < 200) || !(canMove _vcl) );
};

diag_log format ["Infantry Transport Airborne %1, RTB check. unitReady: %2, rtb dist: %3, canMove %4, _rtb: %5", _HeloGrp, unitReady _vcl, (_vcl distance _rtb), canMove _vcl, _rtb];

// if she arrived, if shes ok, then just delete her and her crew.
if (alive _vcl && alive leader _HeloGrp) then
{
	diag_log format ["Infantry Transport Airborne(%1) %2 has exited with (ALL OK) alive _vcl: %3, alive leader _HeloGrp: %4. POSIT: %5, _rtb: %6", PMC_InfTransport, _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl, _rtb];
	{
		deleteVehicle _x;
	} forEach units _HeloGrp;
	deleteVehicle _vcl;
}
else
{
	diag_log format ["Infantry Transport Airborne(%1) %2 has exited with (NOT OK) alive _vcl: %3, alive leader _HeloGrp: %4. POSIT: %5, _rtb: %6", PMC_InfTransport, _HeloGrp, alive _vcl, alive leader _HeloGrp, getPosASL _vcl, _rtb];
};

// we decrease our count for transports active.
PMC_InfTransport = PMC_InfTransport - 1;
publicVariable "PMC_InfTransport";

// add counter with one
PMC_InfTransportUsed = PMC_InfTransportUsed + 1;
publicVariable "PMC_InfTransportUsed";