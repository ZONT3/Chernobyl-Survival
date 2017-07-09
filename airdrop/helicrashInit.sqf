_heli = _this;

sleep 10;

tv = createVehicle ["Land_Basketball_01_F", getPosATL _heli, [], 7, "Can_Collide"];
_relDir = 0;
if ((_heli getDir tv)>getDir _heli) then {
	_relDir = (_heli getDir tv)-getDir _heli;
} else {
	_relDir = getDir _heli-(_heli getDir tv);
};

while {!(((_relDir>=45)&&(_relDir<=135))&&((_heli distance tv)>4.3))} do {
	deleteVehicle tv;
	tv = createVehicle ["Land_Basketball_01_F", getPosATL _heli, [], 7, "Can_Collide"];
	_relDir = 0;
	if ((_heli getDir tv)>getDir _heli) then {
		_relDir = (_heli getDir tv)-getDir _heli;
	} else {
		_relDir = getDir _heli-(_heli getDir tv);
	};
};

hint "Crate spawned.";

_pos = getPosATL tv;
deleteVehicle tv;
_crate = createVehicle ["Box_IND_Wps_F", _pos, [], 0, "Can_Collide"];
[_crate, selectRandom[0]] execVM "airdrop\genCrate.sqf";	