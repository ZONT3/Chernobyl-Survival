ad_droppos = _this;

ad_heli = createVehicle ["RHS_CH_47F", getPosATL ad_heliSpawn, [], 0, "FLY"];
createVehicleCrew ad_heli;
_wp = (group ad_heli) addWaypoint [ad_droppos, 0];
_wp2 = (group ad_heli) addWaypoint [getPosATL ad_heliEnd, 0];

_alvtrg = createTrigger ["EmptyDetector", [0,0]];
_alvtrg setTriggerActivation ["NONE", "PRESENT", false];
_alvtrg setTriggerStatements ["!alive ad_heli", "'Helicopter has crashed!' remoteExec ['hint']; null=ad_heli execVM 'airdrop\helicrashInit.sqf'", ""];

dropCrate ={
	[] spawn {
	_crateType = selectRandom [0];
	sleep (random 6);
	"DROP!" remoteExec ["hint"];
	_heliPos = getPosATL ad_heli;
	_crate = createVehicle ["B_CargoNet_01_Ammo_F", [_heliPos select 0,_heliPos select 1,(_heliPos select 2)-2], [], 0, "NONE"];
	[_crate, _crateType] call compile loadFile "airdrop\genCrate.sqf";
	};
};

_wp setWaypointStatements ["true", "call dropCrate"];
_wp2 setWaypointStatements ["true", "_cr = crew ad_heli; {ad_heli deleteVehicleCrew _x}forEach _cr; deleteVehicle ad_heli"];