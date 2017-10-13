CHSSC_zones = [];
CHSSC_current = "";
CHSSC_mrkPrefix = "sc_mkr_z_";
CHSSC_time = [900, 1200, 1800];
CHSSC_dura = 1080;

_i = 0;
_zone = format["%1%2", CHSSC_mrkPrefix, _i];
while {markerPos _zone select 0 > 0 && markerPos _zone select 1 > 0} do {
	CHSSC_zones pushBack _zone;
	_zone setMarkerAlpha 0;
	_i = _i+1;
	_zone = format["%1%2", CHSSC_mrkPrefix, _i];
};

if (!isDedicated) then {
	[] spawn compile preprocessFile "sc\playerLoop.sqf";
};

if (!isServer) exitWith {};

[] spawn { while {true} do {
	sleep random CHSSC_time;
	if (CHSSC_current == "") then {
		execVM "sc\start.sqf";
	};
	waitUntil {CHSSC_current == ""}
}};
