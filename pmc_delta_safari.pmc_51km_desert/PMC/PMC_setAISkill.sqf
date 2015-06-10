
PMC_setAISkill =
{
	private ["_grp", "_skillValue", "_PMC_Process_Skills"];
	
	_grp = _this select 0;
	
	// max skill value we want to use
	_skillValue = 0.25;
	
	_PMC_Process_Skills =
	{
		private ["_guy","_skillValue"];
	
		_guy = _this select 0;
	        _skillValue = _this select 1;
	        
		{
			_guy setSkill [_x, (random _skillValue)];
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
	};
	
	
	// run it for all of them
	{
		[_x, _skillValue] call _PMC_Process_Skills;
	} forEach units _grp;
};
