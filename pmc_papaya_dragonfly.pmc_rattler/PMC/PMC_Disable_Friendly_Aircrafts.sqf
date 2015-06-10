
if (paramsarray select 4 == 0) then
{
	PMC_Disable_Friendly_Aircrafts = false;
}
else
{
	PMC_Disable_Friendly_Aircrafts = true;
};

if (PMC_debug) then
{
	diag_log format["PMC_Disable_Friendly_Aircrafts: %1", PMC_Disable_Friendly_Aircrafts];
};
