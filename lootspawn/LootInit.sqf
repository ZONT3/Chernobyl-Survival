if(isServer)then{

_medPoints = compile loadFile "spawnpoints\lootMed.sqf";

// Set probability of loot spawning 1-100%
_probability=60;

// Show loot position and type on map (Debugging)
_showLoot=debug;
_showHouses=false;

_dbg = { if (_showHouses) then {
	_id=format ["%1",GETPOS _this];
			_debug=createMarker [_id,GETPOS _this];
			_debug setMarkerShape "ICON";
			_debug setMarkerType "mil_dot";
			_debug setMarkerColor ("ColorBlack");
			_txt=format ["%1",typeOf _this];
			_debug setMarkerText _txt;	
					};};

// Set Weapon loot: Primary weapons, secondary weapons, Sidearms.
weaponsLoot=	["rhs_weap_M107_w", "CUP_srifle_ksvk", "rhs_weap_M107", "rhs_weap_svdp_npz", "rhs_weap_svdp", "rhs_weap_svds_npz", "rhs_weap_svds", "rhs_weap_m249_pip_L", "rhs_weap_pkm", "rhs_weap_pkp", "rhs_weap_vss_npz", "arifle_SPAR_03_khk_F", "rhs_weap_asval_npz", "rhs_weap_m24sws", "rhs_weap_m16a4_carryhandle", "SMG_05_F", "SMG_05_F", "SMG_05_F", "rhs_weap_g36c", "arifle_Mk20_plain_F", "CUP_srifle_CZ550", "rhs_weap_akm_gp25", "rhs_weap_ak74m_gp25", "rhs_weap_m38_rail", "arifle_ak12_F", "rhs_weap_ak74m", "CUP_srifle_LeeEnfield_rail", "rhs_weap_akm", "rhs_weap_ak74", "rhs_weap_aks74u", "CUP_smg_bizon", "hgun_Rook40_F", "rhs_weap_savz61"];
milWeaponsLoot= ["rhs_weap_M107", "CUP_srifle_ksvk", "rhs_weap_m249_pip_S", "rhs_weap_svdp", "rhs_weap_pkm", "rhs_weap_smaw_green", "CUP_arifle_Mk20", "rhs_weap_vss", "rhs_weap_asval", "arifle_SPAR_03_blk_F", "rhs_weap_rpg7", "rhs_weap_m4a1_carryhandle", "CUP_arifle_m16a2", "rhs_weap_ak74m_fullplum_gp25_npz", "rhs_weap_pp2000", "rhs_weap_ak74m_zenitco01_b33"];
// Set items: Weapon attachments, first-aid, Binoculars
itemsLoot=		["CUP_muzzle_snds_SCAR_H", "rhsusf_acc_ACOG_MDO", "rhsusf_acc_EOTECH", "rhsusf_acc_harris_bipod", "rhsusf_acc_eotech_552", "muzzle_snds_M", "muzzle_snds_H", "muzzle_snds_B", "rhs_acc_pbs1", "rhsusf_acc_compm4", "rhs_acc_ekp1", "rhs_magazine_rhs_mag_rgd5", "rhs_magazine_rhs_mag_rdg2_white", "ACE_epinephrine", "FirstAidKit", "rhs_acc_1p63", "rhs_acc_1p29", "bipod_02_F_blk", "CUP_optic_RCO", "rhs_acc_pgo7v", "Binocular", "ACE_epinephrine", "FirstAidKit", "Map"]; //-10 for military
medicalsLoot = ["ACE_adenosine", "ACE_atropine", "ACE_fieldDressing", "ACE_elasticBandage", "ACE_bloodIV", "ACE_epinephrine", "ACE_mophine", "ACE_packingBandage", "ACE_personalAidKit", "ACE_salineIV", "ACE_surgicalKit", "ACE_plasmaIV", "FirstAidKit", "FirstAidKit"];
// Set Clothing: Hats, Helmets, Uniforms
clothesLoot=	["U_O_FullGhillie_lsh", "rhs_altyn_novisor_ess_bala", "rhs_zsh7a_mike", "rhsgref_helmet_pasgt_woodland_rhino", "rhs_tsh4", "rhssaf_uniform_m10_digital_summer", "rhsgref_helmet_m1_painted", "rhs_beret_vdv2", "rhsgref_helmet_m1_bare", "rhsgref_m56", "rhs_uniform_m88_patchless", "rhsgref_uniform_para_ttsko_urban"];
// Set Vests: Any vests
vestsLoot=		["rhsusf_spc_iar", "rhs_6b13_Flora_6sh92_headset_mapcase", "rhs_6b13_6sh92", "rhs_6b13", "rhs_6b23_digi_6sh92_spetsnaz2", "rhs_6b23_6sh116_flora", "rhs_6b23_ML_6sh92_vog", "rhsgref_6b23_ttsko_forest_rifleman", "rhs_6sh92", "rhs_6sh46"];
// Set Backpacks: Any packpacks
backpacksLoot=	["B_Bergen_dgtl_F", "B_ViperHarness_khk_F", "CUP_B_AlicePack_Khaki", "B_ViperLightHarness_khk_F", "rhssaf_kitbag_md2camo", "CUP_B_GER_Pack_Flecktarn", "B_FieldPack_ghex_F", "rhsusf_falconii", "rhsusf_assault_eagleaiii_ocp", "rhs_assault_umbts", "rhs_sidor", "rhs_rpg_empty", "rhs_medic_bag"];

// Exclude buildings from loot spawn. Use 'TYPEOF' to find building name
_exclusionList=	["Land_Pier_F","Land_Pier_small_F","Land_NavigLight","Land_LampHarbour_F"];
milBuildings=["Land_Cargo_HQ_V2_F", "Land_Cargo_Patrol_V2_F", "Land_Fort_watchtower", "Land_Mil_House_dam", "Land_Barrack2_EP1", "Land_Mil_Barracks_i", "Land_Cargo_Tower_V2_F", "Land_Mil_Barracks_EP1", "Land_u_Barracks_V2_F"];
medBuildings=["Land_A_Hospital_dam", "Land_A_Hospital"]+call _medPoints;

private ["_distance","_houseList"];
	_mkr=(_this select 0);
	_mkr setmarkerAlpha 0;
	_pos=markerpos _mkr;
		_mkrY= getmarkerSize _mkr select 0;
		_mkrX= getmarkerSize _mkr select 1;

 _distance=_mkrX;
	if (_mkrY > _mkrX) 
			then {
			_distance=_mkrY;
			};

 _houseList= _pos nearObjects ["House",_distance];
						
		{
	_house=_X;

	_house call _dbg;

	if (!(typeOf _house in _exclusionList)) 
			then {

		
 for "_n" from 0 to 50 do {
 
	_buildingPos=_house buildingpos _n;
		if (str _buildingPos == "[0,0,0]") exitwith {};
					
				if (_probability > random 100) 
					then {
				[_buildingPos,_showLoot,typeOf _house] execVM "lootspawn\spawnloot.sqf";
						};	
					};
				};				
	}foreach _houseList;

 _points = call _medPoints;

 		{
 	_point=_X;

 	if (_probability > random 100) 
					then {
				[getPosATL _point,_showLoot,_point] execVM "lootspawn\spawnloot.sqf";
						};
 	}foreach _points;
	
};//ISSERVER