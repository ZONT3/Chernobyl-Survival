if(isServer)then{
_pos=	(_this select 0);
_pos0=	(_pos select 0);
_pos1=	(_pos select 1);
_pos2=	(_pos select 2);
_showLoot=	(_this select 1);
		_BARREL = createVehicle ["Land_BarrelEmpty_F",[_pos0,_pos1,_pos2+0.35], [], 0, "NONE"];
			sleep 0.5;
			_holder = createVehicle ["groundweaponholder",[_pos0,_pos1,(getposATL _BARREL select 2)], [], 0, "can_Collide"];
				deletevehicle _BARREL;
_type= floor random 6;
if ((_this select 2) in milBuildings) then {_type=selectRandom[6,6,6,7,7,8,9,10,11]};
if ((_this select 2) in medBuildings) then {_type=selectRandom[12,12,12,12,12,12,12,12,12,0]};

	_dbg ={ if (_showLoot) then {			
			_id=format ["%1",_pos];
			_debug=createMarker [_id,GETPOS _holder];
			_debug setMarkerShape "ICON";
			_debug setMarkerType "mil_dot";
			_debug setMarkerColor (_this select 1);
			_txt=format ["%1",_this select 0];
			_debug setMarkerText _txt;	
					};};
						
// Spawn Weapon
 if (_type == 0) 
		then {
	_weapon= weaponsLoot select (floor random [0, count weaponsLoot, 0]); 
	[_weapon, "ColorRed"] call _dbg;
	
		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazineClass = _magazines call bis_fnc_selectRandom; 

	_holder addWeaponCargoGlobal [_weapon, 1];
	 _holder addMagazineCargoGlobal [_magazineClass, floor random[1, 2, 6]];
				};

					
// Spawn Magazines
 if (_type == 1) 
		then {
	_weapon= selectRandom weaponsLoot; 
		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazineClass = _magazines call bis_fnc_selectRandom; 

	 _holder addMagazineCargoGlobal [_magazineClass, floor random[1, 2, 4]];
	 [_magazineClass, "ColorOrange"] call _dbg;
				};	
					
					
// Spawn Items
 if (_type == 2) 
		then {
	_item= itemsLoot select (floor random [0, count itemsLoot, 0]);
	 _holder addItemCargoGlobal [_item, 1];
	
	_clothing= clothesLoot select (floor random [0, count clothesLoot, 0]);
	 _holder addItemCargoGlobal [_clothing, 1];

	[(format ["I:%1 | C:%2", _item, _clothing]), "ColorYellow"] call _dbg;
				};	
					
					
// Spawn Vests
 if (_type == 3) 
		then {
	_vest= vestsLoot select (floor random [0, count vestsLoot, 0]);
	 _holder addItemCargoGlobal [_vest, 1];
	[_vest, "ColorBlue"] call _dbg;
				};
					
					
// Spawn Backpacks
 if (_type == 4) 
		then {
	_backpack= backpacksLoot select (floor random [0, count backpacksLoot, 0]);
	 _holder addBackpackCargoGlobal [_backpack, 1];
	[_backpack, "ColorGreen"] call _dbg;
				};


 if (_type == 5) 
		then { _co=floor random 6; for "_i" from 0 to _co do {
	_item= itemsLoot select (floor random [0, count itemsLoot, 0]);
	 _holder addItemCargoGlobal [_item, 1];

	[(format ["Items:%1", _co+1]), "ColorYellow"] call _dbg;
				};};	


 if (_type == 6) 
		then {
	_weapon= milWeaponsLoot select (floor random [0, count milWeaponsLoot-2, count milWeaponsLoot]); 
	[_weapon, "ColorRed"] call _dbg;
	
		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazineClass = _magazines call bis_fnc_selectRandom; 

	_holder addWeaponCargoGlobal [_weapon, 1];
	 _holder addMagazineCargoGlobal [_magazineClass, floor random[1, 2, 6]];
				};


 if (_type == 7) 
		then {
	_weapon= selectRandom milWeaponsLoot; 
		_magazines = getArray (configFile / "CfgWeapons" / _weapon / "magazines");
		_magazineClass = _magazines call bis_fnc_selectRandom; 

	 _holder addMagazineCargoGlobal [_magazineClass, floor random[1, 2, 4]];
	 [_magazineClass, "ColorOrange"] call _dbg;
				};	


 if (_type == 8) 
		then {
	_item= itemsLoot select (floor random [0, count itemsLoot-10, count itemsLoot]);
	 _holder addItemCargoGlobal [_item, 1];
	
	_clothing= clothesLoot select (floor random [0, count clothesLoot-2, count clothesLoot]);
	 _holder addItemCargoGlobal [_clothing, 1];

	[(format ["I:%1 | C:%2", _item, _clothing]), "ColorYellow"] call _dbg;
				};


 if (_type == 9) 
		then { _co=floor random 6; for "_i" from 0 to _co do {
	_item= itemsLoot select (floor random [0, count itemsLoot-10, count itemsLoot]);
	 _holder addItemCargoGlobal [_item, 1];

	[(format ["Items:%1", _co+1]), "ColorYellow"] call _dbg;
				};};			


 if (_type == 10) 
		then {
	_vest= vestsLoot select (floor random [0, count vestsLoot-2, count vestsLoot]);
	 _holder addItemCargoGlobal [_vest, 1];
	[_vest, "ColorBlue"] call _dbg;
				};


 if (_type == 11) 
		then {
	_backpack= backpacksLoot select (floor random [0, count backpacksLoot-2, count backpacksLoot]);
	 _holder addBackpackCargoGlobal [_backpack, 1];
	[_backpack, "ColorGreen"] call _dbg;
				};


 if (_type == 12) 
		then { _co=floor random 6; for "_i" from 0 to _co do {
	_item= selectRandom medicalsLoot;
	 _holder addItemCargoGlobal [_item, 1];

	[(format ["Items:%1", _co+1]), "ColorPink"] call _dbg;
				};};	

};//IsServer 