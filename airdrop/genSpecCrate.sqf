_crate = _this;
_setups = [];

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

_addWeap ={
	_weap = _this select 0;
	_count = _this select 1;
	_mgcount = _this select 2;

	_crate addWeaponCargoGlobal [_weap, _count];

	for "_i" from 0 to _mgcount-1 do {
		_crate addMagazineCargoGlobal 
			[selectRandom (getArray (configFile / "CfgWeapons" / _weap / "magazines")), 1]
	};

	if (count _this > 3) then {
		_scope = _this select 3;
		_scount = _this select 4;
		_crate addItemCargoGlobal [_scope, _scount];
	}
};

// CRATE SETUPS (FROM MOST RARE TO MOST COMMON):

_setups pushBack {
	["CUP_arifle_G36K", floor random[1,1,2],floor random[2,3,9]] call _addWeap;
	["rhs_weap_m4a1", floor random[0,1,2],floor random[2,3,9],"rhsusf_acc_ACOG_RMR", 1] call _addWeap;
	["rhs_weap_m16a4", floor random[0,1,2],floor random[2,3,9],"rhsusf_acc_ACOG_RMR", 1] call _addWeap;
	["rhs_weap_hk416d10", floor random[0,1,2],floor random[2,3,9],"rhsusf_acc_ACOG_RMR", 1] call _addWeap;
	["CUP_arifle_XM8_compact", floor random 1,floor random[1,3,6]] call _addWeap;
	["CUP_arifle_Mk16_STD", floor random[1,1,2],floor random[1,3,6],"rhsusf_acc_EOTECH", 1] call _addWeap;
	["CUP_arifle_L85A2_NG",floor random[0,1,2],floor random[1,2,5],"CUP_optic_HoloBlack", 3] call _addWeap;
	["arifle_Mk20_F",floor random[0,1,1],floor random [1,3,6]] call _addWeap;
	["arifle_TRG20_F",floor random[0,1,1],floor random [1,3,6], "CUP_optic_CompM4", 2] call _addWeap;
};

// SETUPS END

call (_setups select (floor random [0, count _setups, 0]))

