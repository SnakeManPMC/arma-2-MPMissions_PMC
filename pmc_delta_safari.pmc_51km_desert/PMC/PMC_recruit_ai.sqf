/*
this is debug fake bullshit thing for pathetic SP == MP gameplay, its meant to be removed when more players join :(

Syntax:
this addAction ["Recruit AI", "PMC\PMC_recruit_ai.sqf", true];

Returns:
one fucking fake AI for ya ;)
*/

private ["_ainum","_ap","_i","_grp","_count","_dude"];

_grp = group player;
_count = (count units _grp);
_ainum = 0;
_ap = player;
_i = 0;
while {_i < _count} do
{
	_ap = (units _grp select _i);
	if (not (isPlayer _ap)) then
	{
		_ainum = _ainum +1;
	};
	_i = _i + 1;
};

if (player != (leader group player)) exitwith {hint "You must be an Officer to recruit"};

if (_ainum >= 9) exitwith {hint "You have reached Maximum Squad Size ";};

_dude = group player createUnit ["US_Delta_Force_EP1", getPosASL player, [], 0, "FORM"];
_dude addEventHandler ["killed", {handle = _this execVM "PMC\PMC_killed.sqf"}];

{
	_dude setSkill [_x, 1];
} forEach
[
	"aimingAccuracy",
	"aimingShake",
	"aimingSpeed",
	"endurance",
	"spotDistance",
	"spotTime",
	"courage",
	"reloadSpeed",
	"commanding",
	"general"
];
