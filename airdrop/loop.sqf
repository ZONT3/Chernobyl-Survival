while {true} do {
	sleep random AD_time;

	if (!AD_started) then {
		_bpos = markerPos "ad_spawnzone";
		_radius = markerSize "ad_spawnzone" select 0;
		_bar = createVehicle ["Land_BarrelEmpty_F", _bpos, [], _radius, "NONE"];
		sleep 1;
		_pos = [getPos _bar select 0, getPos _bar select 1, AD_height];
		deleteVehicle _bar;

		_dz = createMarker [format["ad_dz_%1", AD_count], _pos];
		_dz setMarkerColor "ColorYellow";
		_dz setMarkerShape "ELLIPSE";
		_dz setMarkerBrush "BDiagonal";
		_dz setMarkerSize [500, 500];
		_dp = createMarker [format["ad_dp_%1", AD_count], _pos];
		_dp setMarkerColor "ColorOrange";
		_dp setMarkerType "mil_dot";
		_dp setMarkerText "Supply Airdrop";
		[_dz, _dp] spawn {sleep 150; deleteMarker (_this select 0); deleteMarker (_this select 1)};

		[_pos, "airdrop\genCrate.sqf", random 5, 250] spawn compile preprocessFile "airdrop\spawn.sqf";
	};
}