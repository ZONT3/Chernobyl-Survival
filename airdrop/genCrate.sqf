_ind = _this select 1;
_crate = _this select 0;

if (_ind == -1) exitWith {10};

clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

addWeap ={
	_weap = _this select 0;
	_count = _this select 1;
	_mgcount = _this select 2;
	_scope = _this select 3;
	_scount = _this select 4;

	_crate addWeaponCargoGlobal [_weap, _count];

	for "_i" from 0 to _mgcount-1 do {
		_crate addMagazineCargoGlobal 
			[selectRandom (getArray (configFile / "CfgWeapons" / _weap / "magazines")), 1]
	};

	if (!isNull _scope) then {
		_crate addItemCargoGlobal [_scope, _scount];
	}
};

if (_ind == 0) then {
	addWeap["CUP_arifle_G36K", floor random[1,1,2],floor random[2,3,9]];
	addWeap["rhs_weap_m4a1", floor random[0,1,2],floor random[2,3,9],"rhsusf_acc_ACOG_RMR", 1];
	addWeap["rhs_weap_m16a4", floor random[0,1,2],floor random[2,3,9],"rhsusf_acc_ACOG_RMR", 1];
	addWeap["rhs_weap_hk416d10", floor random[0,1,2],floor random[2,3,9],"rhsusf_acc_ACOG_RMR", 1];
	addWeap["CUP_arifle_XM8_compact", floor random 1,floor random[1,3,6]];
	addWeap["CUP_arifle_Mk16_STD", floor random[1,1,2],floor random[1,3,6],"rhsusf_acc_EOTECH", 1];
	addWeap["CUP_arifle_L85A2_NG",floor random[0,1,2],floor random[1,2,5],"CUP_optic_HoloBlack", 3];
	addWeap["arifle_Mk20_F",floor random[0,1,1],floor random [1,3,6]];
	addWeap["arifle_TRG20_F",floor random[0,1,1],floor random [1,3,6], "CUP+optic_CompM4", 2];

};

if (_ind == 1) then {
	
};

if (_ind == 2) then {

};

if (_ind == 3) then {

};

if (_ind == 4) then {

};

if (_ind == 5) then {

};

if (_ind == 6) then {

};

if (_ind == 7) then {

};