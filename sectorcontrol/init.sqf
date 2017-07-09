if (!isServer) exitWith {};

sc_zonelist = call compile loadFile "spawnpoints\sectorcontrolZones.sqf";
sc_performing = false;

sc_trigger = createTrigger ["EmptyDetector", [0,0], true];
sc_trigger setTriggerActivation ["NONE", "PRESENT", true];
sc_trigger setTriggerStatements ["!sc_performing", "0=execVM 'sectorcontrol\create.sqf'", ""];
sc_trigger setTriggerTimeout [420, 900, 1500, true];
sc_trigger_disable = createTrigger ["EmptyDetector", [0,0], true];
sc_trigger_disable setTriggerActivation ["NONE", "PRESENT", true];
sc_trigger_disable setTriggerStatements ["sc_performing", "0=execVM 'sectorcontrol\remove.sqf'", ""];
sc_trigger_disable setTriggerTimeout [300, 600, 900, true];