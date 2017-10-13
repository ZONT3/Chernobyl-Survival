while {true} do {
	waitUntil {CHSSC_current != ""};
	hint format["Sector control has started in/on/at/near %1.\nAfter 10 minutes, group, which was last, who controlled sector, will receive a special airdrop.", markerText CHSSC_current];

	CHSSC_lastWinner = false;

	_pos = markerPos CHSSC_current;
	_area = markerSize CHSSC_current;
	_area pushBack markerDir CHSSC_current;
	_area pushBack (markerShape CHSSC_current == "RECTANGLE");

	_trg = createTrigger ["EmptyDetector", _pos, false];
	_trg setTriggerArea _area;
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];

	_trg spawn { 
		_mark = createMarkerLocal ["CHSSC_localZoneMark", getPos _this];
		_mark setMarkerSizeLocal [(triggerArea _this select 0), (triggerArea _this select 1)];
		_mark setMarkerBrushLocal "SolidBorder";
		if (triggerArea _this select 3) then {_mark setMarkerShapeLocal "RECTANGLE"}
		else {_mark setMarkerShapeLocal "ELLIPSE"};
		_mark setMarkerDirLocal (triggerArea _this select 2);
		_mark setMarkerColorLocal "ColorBlack";

		while {CHSSC_current != ""} do {
			sleep 1;
			_list = [];
			_list = +(list _this);

			_ally = 0;
			_eny = 0;

			for "_i" from 0 to count _list -1 do {
				_pl = _list select _i;

				if (group _pl == group player) then {_ally = _ally+1}
				else {_eny = _eny+1};
			};

			if (_ally>_eny) then {
				_mark setMarkerColorLocal "ColorGreen";
				CHSSC_lastWinner = true;
			};
			if (_eny>_ally) then {
				_mark setMarkerColorLocal "ColorRed";
				CHSSC_lastWinner = false;
			};
			if (_ally==_eny) then {
				if (_ally==0) then {
					_mark setMarkerColorLocal "ColorBlack";
				} else {
					_mark setMarkerColorLocal "ColorOrange";
				}
			};
		};

		deleteMarkerLocal _mark;
	};

	waitUntil {CHSSC_current == ""};
	deleteVehicle _trg;

	if (CHSSC_lastWinner) then {
		if (leader player == player) then {
			hint "Congrats! Your group was last, which controlled the sector! As a leader, you have received a special airdrop. Call it from action menu."; 
			CHS_pl_specdrops = CHS_pl_specdrops+1;
		} else {
			hint "Congrats! Your group was last, which controlled the sector! Your leader has received a special airdrop.";
		};
	} else {hint "Sector control ended. Group leader, which has won have received a special airdrop"};
}