_veh = _this select 0;
_script = _this select 1;

_chutePos = [(getpos _veh select 0), (getPos _veh select 1)-10, (getPos _veh select 2)-10];

_crate = "B_CargoNet_01_Ammo_F" createVehicle _chutePos;
_chute =  "B_Parachute_02_F" createVehicle _chutePos;
_chute setPos _chutePos;
_crate setPos _chutePos;
_crate attachto [_chute, [0,0,0]];

_crate execVM _script;

waitUntil {getPos _crate select 2 < 5};

_smoke = "SmokeShellblue" createVehicle _chutePos;
_smoke attachto [_crate, [0,0,0]];
