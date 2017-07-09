if (isDedicated) exitWith {};
_list = _this;
_ally = 0;
_enemy = 0;
{
	if (group _x == group player) then {_ally=_ally+1} else {_enemy=_enemy+1};
} foreach _list;

if (_ally>_enemy) then {sc_winner=true};
if (_ally<_enemy) then {sc_winner=false};

if (_ally>0) then {sc_zone setMarkerColorLocal "ColorGreen"; hint "ALLY MORE THAN 0"};
if (_enemy>0) then {sc_zone setMarkerColorLocal "ColorRed"; hint "ENEMY MORE THAN 0"};
if ((_enemy>0)&&(_ally>0)) then {sc_zone setMarkerColorLocal "ColorOrange"; hint "ENEMY AND ALLY MORE THAN 0"};
if ((_enemy==0)&&(_ally==0)) then {sc_zone setMarkerColorLocal "ColorYellow"; hint "NOONE IN TRIGGER"};