_spawnpoints = call compile loadFile "spawnpoints\players.sqf";
waitUntil {!isNull player};
player setPos getPos selectRandom _spawnpoints;
