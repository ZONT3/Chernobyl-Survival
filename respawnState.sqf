for "_i" from 0 to (count toRespawn)-1 do {
	if (((toRespawn select _i) select 0) == _this) then {
		_res = (toRespawn select _i) select 1;
		if (_res) then {
			(toRespawn select _i) set [_this, false];
			true;
		};
		false;
	};
};
toRespawn pushBack [_this, true];
false