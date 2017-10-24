RADEXA_delay = [480, 720, 900];
RADEXA_started = false;

spawn {
	sleep random RADEXA_delay;
	if (!RADEXA_started) then {
		// DO SOMTHING
	}
	waitUntil {!RADEXA_started};
};

