
waitUntil {!(isNull player)};
waitUntil {player == player};

/*

	city1 objective

*/
player createDiaryRecord
[
	"Diary",
	[
		"Marum",
		"Marum is under US control, USMC riflemen has been seen in the city. Try to kill them all.<br/><marker name='city1'>Marum location</marker>"
	]
];

PMC_city1_task = player createSimpleTask
[
	"city1"
];
PMC_city1_task setSimpleTaskDescription
[
	"Marum<br/>Check <marker name='city1'>Marum</marker> for location.",
	"Marum",
	"Marum"
];
PMC_city1_task setSimpleTaskDestination (getMarkerPos "city1");


/*

	city2 objective

*/
player createDiaryRecord
[
	"Diary",
	[
		"Camerig",
		"Try to capture Camerig back from the USMC/CDF enemy!<br/><marker name='city2'>Camerig location</marker>"
	]
];

PMC_city2_task = player createSimpleTask
[
	"Camerig"
];
PMC_city2_task setSimpleTaskDescription
[
	"Camerig<br/>Check <marker name='city2'>Camerig</marker> for location.",
	"Camerig",
	"Camerig"
];
PMC_city2_task setSimpleTaskDestination (getMarkerPos "city2");


/*

	airstrip objective

*/
player createDiaryRecord
[
	"Diary",
	[
		"Russian Airstrip",
		"Airstrip is holding scum sucking Russian enemy, kill them all and bow everything up!<br/><marker name='airstrip'>airstrip location</marker>"
	]
];

PMC_airstrip_task = player createSimpleTask
[
	"Airstrip"
];
PMC_airstrip_task setSimpleTaskDescription
[
	"Airstrip<br/>Check <marker name='airstrip'>airstrip</marker> for location.",
	"Airstrip",
	"Airstrip"
];
PMC_airstrip_task setSimpleTaskDestination (getMarkerPos "airstrip");


/*

	airfield objective

*/
player createDiaryRecord
[
	"Diary",
	[
		"Military base",
		"Military base is held by the Russians, go there and kill them all!<br/><marker name='airfield'>Military Base location</marker>"
	]
];

PMC_airfield_task = player createSimpleTask
[
	"Military base"
];
PMC_airfield_task setSimpleTaskDescription
[
	"Military base<br/>Check <marker name='airfield'>Military base</marker> for location.",
	"Military base",
	"Military base"
];
PMC_airfield_task setSimpleTaskDestination (getMarkerPos "airfield");

/*

	Generic situation for player.

*/

player createDiaryRecord
[
	"Diary",
	[
		"Situation",
		"You are a scumbag terrorist, act like a rapist thief and a fucker that you are!<br/>Check out the forward line of troops (FLOT) shown <marker name='flot'>with this line</marker> here.<br/><br/>North side is Russians.<br/>South side is USA.<br/><br/>Make every effort to start war between them. Do this by trying to lure either one of the sides towards the other which causes them to initiate firefight, then just disappear into the background laughing your ass off."
	]
];
