if (!isServer) exitWith {};

AD_vehicle = "RHS_C130J";
AD_count = 0;
AD_time = [720, 1200, 1800];
AD_height = 200;
AD_started = false;

"ad_spawnzone" setMarkerAlpha 0;

[] spawn compile loadFile "airdrop\loop.sqf"
