
PMC_mobile_respawn_spot = getPosASL player;
publicVariable "PMC_mobile_respawn_spot";
"respawn_guerrilla" setMarkerPos PMC_mobile_respawn_spot;
pmc_guerrilla_cache setPos PMC_mobile_respawn_spot;
hint "Mobile Respawn set here.";
