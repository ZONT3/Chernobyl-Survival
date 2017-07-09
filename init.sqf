debug=false;

if (!isServer) then {exit};

sp_players = call compile loadFile "spawnpoints\players.sqf";
trigger_respawn_act = {
	for "_i" from 0 to (count _this) do {
		_pos = getPosASL selectRandom sp_players;
		(_this select _i) setPosASL _pos;
		hint format ["Player %1 spawned on X%2 Y%3 Z%4", (_this select _i), _pos select 0, _pos select 1, _pos select 2];
	};
};

"ad_spawnzone" setMarkerAlpha 0;
null="mkr" execVM "lootspawn\respawnLoot.sqf";
execVM "airdrop\init.sqf";
execVM "sectorcontrol\init.sqf";
