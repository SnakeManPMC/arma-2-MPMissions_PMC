/*
*/
private
[
	"_a",
	"_tasks"
];

_tasks = count (_this select 0);

_a = _tasks;
while { _a > 0 } do
{
	_obj = missionNamespace getVariable [format ["PMC_objective%1", _a], objNull];
	_obj = player createSimpleTask [format["Clear objective %1", _a]];
	_obj setSimpleTaskDescription [format["Clear <marker name='pmc_objective_marker%1'>objective %1</marker>", _a], format["Clear objective %1", _a], format["Clear objective %1", _a]];
	_obj setSimpleTaskDestination (getMarkerPos format["pmc_objective_marker%1", _a]);

	_a = _a - 1;
};
