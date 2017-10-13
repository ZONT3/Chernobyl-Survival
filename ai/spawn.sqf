CHSAI_setPatrol ={
	private ["_grp", "_pos"];
	_grp = _this select 0;
	_pos = _this select 1;

	_wp = _grp addWaypoint [_pos, 350];
	_fpos = waypointPosition _wp;
	for "_i" from 0 to 5 do {_grp addWaypoint [_pos, 350]};
	_loop = _grp addWaypoint [_fpos, 0];
	_loop setWaypointType "LOOP";
};

for "_i" from 0 to count CHSAI_resps_t1 -1 do {
	_pos = getPosATL (CHSAI_resps_t1 select _i);
	_grp = createGroup independent;
	_units = floor random [1, 2, 5];

	if (random 100 < 65) then {
		for "_i" from 0 to _units -1 do {
			_unit = _grp createUnit [selectRandom CHSAI_units_t1, _pos, [], 5, "NONE"];
			_unit setSkill 1;
		};
	};

	[_grp, _pos] call CHSAI_setPatrol;
};

for "_i" from 0 to count CHSAI_resps_t2 -1 do {
	_pos = getPosATL (CHSAI_resps_t2 select _i);
	_grp = createGroup independent;
	_units = floor random [1, 2, 5];

	if (random 100 < 65) then {
		for "_i" from 0 to _units -1 do {
			_unit = _grp createUnit [selectRandom CHSAI_units_t2, _pos, [], 5, "NONE"];
			_unit setSkill 1;
		};
	};

	[_grp, _pos] call CHSAI_setPatrol;
};

for "_i" from 0 to count CHSAI_resps_t3 -1 do {
	_pos = getPosATL (CHSAI_resps_t3 select _i);
	_grp = createGroup independent;
	_units = floor random [1, 2, 5];

	if (random 100 < 65) then {
		for "_i" from 0 to _units -1 do {
			_unit = _grp createUnit [selectRandom CHSAI_units_t3, _pos, [], 5, "NONE"];
			_unit setSkill 1;
		};
	};

	[_grp, _pos] call CHSAI_setPatrol;
};

for "_i" from 0 to count CHSAI_resps_t4 -1 do {
	_pos = getPosATL (CHSAI_resps_t4 select _i);
	_grp = createGroup independent;
	_units = floor random [1, 2, 5];

	if (random 100 < 65) then {
		for "_i" from 0 to _units -1 do {
			_unit = _grp createUnit [selectRandom CHSAI_units_t4, _pos, [], 5, "NONE"];
			_unit setSkill 1;
		};
	};

	[_grp, _pos] call CHSAI_setPatrol;
};
