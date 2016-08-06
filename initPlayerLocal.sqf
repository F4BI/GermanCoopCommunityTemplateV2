// by Quentin


// log start of execution
diag_log format ["%1 --- Executing initPlayerLocal.sqf",diag_ticktime];


////////////////////////////////////////// initialize QTS for JIPers //////////////////////////////////////////
if (didJIP) then
{
	if (!isNil "QT_call_fncs") then {{[player] call _x} count QT_call_fncs};
	if (!isNil "QT_spawn_fncs") then {{[player] spawn _x} forEach QT_spawn_fncs};

	// if player is a curator, initialize QTS on units spawned by him
	if (typeOf player == "VirtualCurator_F" or typeOf player == "B_VirtualCurator_F" or typeOf player == "C_VirtualCurator_F" or typeOf player == "I_VirtualCurator_F" or typeOf player == "O_VirtualCurator_F") then
	{
		player addEventHandler [
			"CuratorObjectPlaced",
			{
				//_entity = _this select 1;			
				if ((_this select 1) in (allUnits - allPlayers - playableUnits - entities "HeadlessClient_F")) then	// if entity spawned is an AI unit...
				{
					if (!isNil "QT_AI_call_fncs") then {{[_this select 1] call _x} count QT_AI_call_fncs};	// ...initialize QT_AI_call_fncs for it
					if (!isNil "QT_AI_spawn_fncs") then {{[_this select 1] spawn _x} forEach QT_AI_spawn_fncs};	// ...initialize QT_AI_spawn_fncs for it
				};
				{_x addCuratorEditableObjects [[_this select 1],true]} count allCurators;	// ...add placed entity to editable objects for the other curators
			}
		];
	};
};
////////////////////////////////////////// QTS initialization for JIPers complete //////////////////////////////////////////


////////////////////////////////////////// briefing file //////////////////////////////////////////
// see initBriefing.hpp file for briefing sections
#include "initBriefing.hpp"
// QTS entries
player createDiarySubject ["QTS","QTS"];
player createDiaryRecord [
	"QTS",
	[
		"Ohrstöpsel",
			"<br/><font color='#107b1b'>Linke Windows-Taste</font color> auf der Tastatur, um die Ohrstöpsel umzuschalten."
	]
];
// Revive explanation
player createDiarySubject ["Revive","How To"];
player createDiaryRecord [
	"How To",
	[
		"How To",
			"Das Revivesystem ist darauf ausgelegt, den Spieler bei Treffern durch großkalibrige Projektile oder bei Treffern auf ungeschützte Areale zu töten. Nur Sanitäter können wiederbeleben, wenn sie ein Medikit bei sich tragen."
	]
];
////////////////////////////////////////// briefing complete //////////////////////////////////////////


// initialize MissionProtectionSystem
private _BFT_InitServer = compile preprocessFileLineNumbers "Scripts\MissionProtectionSystem\InitClient.sqf";
call _BFT_InitServer;

// log end of execution
diag_log format ["%1 --- initPlayerLocal.sqf executed",diag_ticktime];
