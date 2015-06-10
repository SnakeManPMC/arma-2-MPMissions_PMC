// west is our player, that side is already created.
createCenter East;

// make them enemies
east setFriend [west, 0];
west setFriend [east, 0];
