if (!isServer) exitWith {};

sc_zone = selectRandom call compile loadFile "spawnpoints\sectorcontrolZones.sqf";

_mkr = createMarker ["sc_zone", getPos sc_zone];
_mkr setMarkerDir getDir sc_zone;
_mkr setMarkerShape "ELLIPSE";
_mkr setMarkerColor "ColorYellow";
_mkr setMarkerBrush "DIAGGRID";
_mkr setMarkerSize [, 200];
