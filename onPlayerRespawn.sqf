// by Quentin


// log start of execution
diag_log format ["%1 --- Executing onPlayerRespawn.sqf",diag_ticktime];


// ZFW
private _ZFW_onPlayerRespawn = compile preprocessFileLineNumbers "modules\ZeusFramework\ZFW_onPlayerRespawn.sqf";
call _ZFW_onPlayerRespawn;


// apply default unit loadout on respawn
player setUnitLoadout plyr_ldt;


/* mission specific code comes here */



/* end of mission specific code */


// log end of execution
diag_log format ["%1 --- onPlayerRespawn.sqf executed",diag_ticktime];
