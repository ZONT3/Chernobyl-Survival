if (isServer) then {

"WARNING!!! ALL LOOT ON GROUND WILL BE DELETED IN 10 SECONDS!" remoteExec ["hint"];
sleep 10;
private ["_distance","_houseList"];
_mkr = _this;
_mkr setmarkerAlpha 0;
_pos=markerpos _mkr;
_mkrY= getmarkerSize _mkr select 0;
_mkrX= getmarkerSize _mkr select 1;
_distance=_mkrX;
if (_mkrY > _mkrX) then {_distance=_mkrY};
_whList= _pos nearObjects ["groundweaponholder",_distance];
{deleteVehicle _x} forEach _whList;
null=[_mkr] execVM "lootspawn\LootInit.sqf";
}