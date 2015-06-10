
if (paramsarray select 3 == 0) then
{
	PMC_Disable_Friendly_AI = false;
}
else
{
	PMC_Disable_Friendly_AI = true;
};

if (PMC_debug) then
{
	diag_log format["PMC_Disable_Friendly_AI: %1", PMC_Disable_Friendly_AI];
};
