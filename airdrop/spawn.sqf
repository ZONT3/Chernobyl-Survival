AD_started = true;

_pos = _this select 0;
_drscript = _this select 1;
_slp = _this select 2;
_rr = _this select 3;

_dir = ad_start getRelDir _pos; 
_veh = createVehicle [AD_vehicle, getPos ad_start, [], 0, "FLY"];
_veh setDir _dir;
_veh flyInHeight AD_height;
_veh setVelocity [sin(_dir)*55,cos(_dir)*55,0];

_grp = createGroup west;
_pilot = _grp createUnit ["B_Pilot_F", [0,0,0], [], 0, "FORM"];
_pilot assignAsDriver _veh;
_pilot moveInDriver _veh;

_wp_drop = _grp addWaypoint [_pos, _rr];
_wp_drop setWaypointType "MOVE";
_wp_drop setWaypointSpeed "FULL";

_wp_exit = _grp addWaypoint [getPos ad_end, 0];
_wp_exit setWaypointType "MOVE";
_wp_exit setWaypointSpeed "FULL";
_wp_exit setWaypointStatements ["true", "AD_started = false"];

/*
_veh spawn {
	private ["_plane", "_marker"];
	_plane = _this;

	_marker = createMarkerLocal [format ["AD_MARK_%1", AD_count], [0,0]];
	_marker setMarkerColorLocal "ColorWhite";
	_marker setMarkerTypeLocal "n_plane";

	while {alive _plane or !isNull _plane} do {
	 	_marker setMarkerPosLocal getPos _plane;
	 	sleep 1;
	};

	deleteMarkerLocal _marker;
};
*/

"Airdrop by USAF has been sended!" remoteExec ["hint"];

waitUntil {(getPos _veh) distance2D _pos <= 300};
sleep _slp;

[_veh, _drscript] spawn compile loadFile "airdrop\drop.sqf";

waitUntil {!AD_started || !alive _veh};
AD_started = false;
deleteVehicle _veh;
deleteVehicle _pilot;
deleteGroup _grp;
AD_count = AD_count+1;