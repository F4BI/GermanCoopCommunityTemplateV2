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
player createDiaryRecord [
	"QTS",
	[
		"Gesten",
			"
			Tastatur 4: <font color='#107b1b'>""Los!""</font color><br/>
			Tastatur 5: <font color='#FF0000'>""Halt!""</font color><br/>
			Tastatur 6: <font color='#107b1b'>""Positiv!""</font color><br/>
			Tastatur 7: <font color='#FF0000'>""Negativ!""</font color><br/>
			Tastatur 8: <font color='#0a648c'>""Sichtkontakt auf (-Richtung- )!""</font color><br/><br/>
			
			Wenn der Gruppenchat aktiviert ist, sagt der Spieleravatar Entsprechendes.
			"
	]
];
////////////////////////////////////////// briefing complete //////////////////////////////////////////


// log end of execution
diag_log format ["%1 --- initPlayerLocal.sqf executed",diag_ticktime];