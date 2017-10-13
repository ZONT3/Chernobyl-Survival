if (!isServer) exitWith {};

CHSAI_prefix_t1 = "ai_t1_";
CHSAI_prefix_t2 = "ai_t2_";
CHSAI_prefix_t3 = "ai_t3_";
CHSAI_prefix_t4 = "ai_t4_";

CHSAI_resps_t1 = [];
CHSAI_resps_t2 = [];
CHSAI_resps_t3 = [];
CHSAI_resps_t4 = [];

CHSAI_units_t1 = ["rhsgref_ins_g_commander", "rhsgref_ins_g_crew", "rhsgref_ins_g_rifleman_aksu"];
CHSAI_units_t2 = ["rhsgref_ins_g_militiaman_mosin", "rhsgref_ins_g_rifleman", "rhsgref_ins_g_spotter", "rhsgref_ins_g_engineer", "rhsgref_ins_g_saboteur"];
CHSAI_units_t3 = ["rhsgref_ins_g_rifleman_akm", "rhsgref_ins_g_grenadier", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_specialist_aa"];
CHSAI_units_t4 = ["rhsgref_ins_g_rifleman_RPG26", "rhsgref_ins_g_sniper", "rhsgref_ins_g_machinegunner", "rhsgref_ins_g_specialist_at"];

_resp = format["%1%2", CHSAI_prefix_t1, 1];
for [{_i=2}, {!isNil _resp}, {_i=_i+1}] do {
	CHSAI_resps_t1 pushBack (call compile _resp);
	_resp = format["%1%2", CHSAI_prefix_t1, _i];
};
_resp = format["%1%2", CHSAI_prefix_t2, 1];
for [{_i=2}, {!isNil _resp}, {_i=_i+1}] do {
	CHSAI_resps_t2 pushBack (call compile _resp);
	_resp = format["%1%2", CHSAI_prefix_t2, _i];
};
_resp = format["%1%2", CHSAI_prefix_t3, 1];
for [{_i=2}, {!isNil _resp}, {_i=_i+1}] do {
	CHSAI_resps_t3 pushBack (call compile _resp);
	_resp = format["%1%2", CHSAI_prefix_t3, _i];
};
_resp = format["%1%2", CHSAI_prefix_t4, 1];
for [{_i=2}, {!isNil _resp}, {_i=_i+1}] do {
	CHSAI_resps_t4 pushBack (call compile _resp);
	_resp = format["%1%2", CHSAI_prefix_t4, _i];
};

execVM "ai\spawn.sqf";
