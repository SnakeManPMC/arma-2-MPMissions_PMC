
/*

backpacks:
TKG_ALICE_Pack_AmmoAK47_EP1
TKG_ALICE_Pack_AmmoAK74_EP1

guerrilla ammo boxes:
GuerillaCacheBox_EP1

*/

// ammo box for guerrilla
createVehicle ["GuerillaCacheBox_EP1", (getMarkerPos "respawn_guer"), [], 0, "NONE"];

// this doesn't work, why? works only on clients ;)
//clearMagazineCargo _tmp;
//clearWeaponCargo _tmp;

// two alice backpacks to the ground.
createVehicle ["TKG_ALICE_Pack_AmmoAK47_EP1", (getMarkerPos "respawn_guer"), [], 0, "NONE"];
createVehicle ["TKG_ALICE_Pack_AmmoAK74_EP1", (getMarkerPos "respawn_guer"), [], 0, "NONE"];
