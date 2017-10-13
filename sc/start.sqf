CHSSC_current = selectRandom CHSSC_zones;
publicVariable "CHSSC_current";

// server-side expression

[] spawn {
	sleep CHSSC_dura;
	CHSSC_current = "";
	publicVariable "CHSSC_current";
};
