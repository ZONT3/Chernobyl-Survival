debug=false;

execVM "initPlayer.sqf";

"mkr" spawn compile preprocessFile "lootspawn\respawnLoot.sqf";
execVM "airdrop\init.sqf";
execVM "sc\init.sqf";
execVM "ai\init.sqf";