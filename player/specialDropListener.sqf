_actTitle = "[%1] Call special airdrop";
_actScript ={
	hint "Click on map where you want.\nShift+click will cancel calling.";
	onMapSingleClick {
		if (!_shift) then {
			_r = floor random 1000;
			_dz = createMarker [format["sd_a_%1", _r], _pos];
			_dz setMarkerColor "ColorYellow";
			_dz setMarkerShape "ELLIPSE";
			_dz setMarkerBrush "BDiagonal";
			_dz setMarkerSize [200, 200];
			_dp = createMarker [format["sd_m_%1", _r], _pos];
			_dp setMarkerColor "ColorOrange";
			_dp setMarkerType "mil_dot";
			_dp setMarkerText "Special Airdrop";
			[_dz, _dp] spawn {sleep 150; deleteMarker (_this select 0); deleteMarker (_this select 1)};

			[_pos, "airdrop\genSpecCrate.sqf", 2.2, 0] spawn compile preprocessFile "airdrop\spawn.sqf";
			CHS_pl_specdrops = CHS_pl_specdrops-1;
		};
		onMapSingleClick "";
		true
	}
};

_last = 0;
while {true} do {
	waitUntil {CHS_pl_specdrops!=_last};

	if (_last == 0) then {CHS_pl_sda = player addAction [format[_actTitle, CHS_pl_specdrops], _actScript, nil, 6]}
	else {player setUserActionText [CHS_pl_sda, format[_actTitle, CHS_pl_specdrops]]};
	if (CHS_pl_specdrops == 0) then {player removeAction CHS_pl_sda};
	_last = CHS_pl_specdrops;
}