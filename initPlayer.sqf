if (isDedicated) exitWith {};
waitUntil {!isNull player};

CHS_pl_specdrops = 0;
CHS_pl_sda = -1;

[] spawn compile preprocessFile "player\specialDropListener.sqf";
