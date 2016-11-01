// by Quentin


// log start of execution
diag_log format ["%1 --- Executing initPlayerLocal.sqf",diag_ticktime];


// reset EH to avoid unwanted impacts on mission flow (for example after player slot changed)
player removeAllMPEventHandlers "MPKilled";
player removeAllEventHandlers "Fired";
player removeAllEventHandlers "CuratorObjectPlaced";


// fade in from black (placed here to be executed before security dialog)
0 cutText ["","BLACK IN",8];


////////////////////////////////////////// briefing file //////////////////////////////////////////
// see initBriefing.hpp file for briefing sections
#include "initBriefing.hpp"
////////////////////////////////////////// briefing complete //////////////////////////////////////////


// initialize MissionProtectionSystem
private _MPS_InitClient = compile preprocessFileLineNumbers "scripts\MissionProtectionSystem\MPS_InitClient.sqf";
call _MPS_InitClient;


////////////////////////////////////////// initialize QTS (also for JIPers) //////////////////////////////////////////
// initialize QTS on player
if (!isNil "QT_call_fncs") then {{[player] call _x} count QT_call_fncs};
if (!isNil "QT_spawn_fncs") then {{[player] spawn _x} forEach QT_spawn_fncs};

// if player is a curator, initialize QTS on units spawned by him
if (typeOf player in ["VirtualCurator_F","B_VirtualCurator_F","O_VirtualCurator_F","I_VirtualCurator_F","C_VirtualCurator_F"]) then
{
	// single units
	// SilentSpike: getAssignedCuratorLogic command will return objNull if used immediately after the curator logic is assigned to the unit in question (this includes at mission time 0). To avoid problems use the following beforehand
	waitUntil {!isNull (getAssignedCuratorLogic player)};
	COP_EH = (getAssignedCuratorLogic player) addEventHandler [
		"CuratorObjectPlaced",
		{
			private _entity = _this select 1;			
			if (_entity in (allUnits - playableUnits - entities "HeadlessClient_F")) then	// if entity spawned is an AI unit...
			{
				if (!isNil "QT_AI_call_fncs") then {{[_entity] call _x} count QT_AI_call_fncs};	// ...initialize QT_AI_call_fncs for it
				if (!isNil "QT_AI_spawn_fncs") then {{[_entity] spawn _x} forEach QT_AI_spawn_fncs};	// ...initialize QT_AI_spawn_fncs for it
			};
			{[_x,[[_entity],true]] remoteExec ["addCuratorEditableObjects",2]; nil;} count (allCurators - [getAssignedCuratorLogic player]);	// add placed entity to editable objects for the other curators
		}
	];
/*	// AI groups
	(getAssignedCuratorLogic player) addEventHandler [
		"CuratorGroupPlaced",
		{
			// declare EH variables
			_curator = _this select 0;
			_group = _this select 1;
			
			if (_group in allGroups) then	// if group spawned is an AI group...
			{
				if (!isNil "QT_AI_call_fncs") then {{[_entity] call _x} count QT_AI_call_fncs};	// ...initialize QT_AI_call_fncs for it
				if (!isNil "QT_AI_spawn_fncs") then {{[_entity] spawn _x} forEach QT_AI_spawn_fncs};	// ...initialize QT_AI_spawn_fncs for it
			};
			{_x addCuratorEditableObjects [[_entity],true]} count (allCurators - [_curator]);	// ...add placed entity to editable objects for the other curators
		}
	];*/
};
////////////////////////////////////////// QTS initialization for JIPers complete //////////////////////////////////////////


// save default unit loadout to apply on respawn later
/*if ((uniform player == "U_B_CombatUniform_mcam") or {uniform player == "U_B_CombatUniform_mcam_tshirt"} or {uniform player == "U_B_CombatUniform_mcam_vest"}) then
{
	player setObjectTextureGlobal [0,"\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
	//player addVest "V_PlateCarrier2_rgr";
	//player addHeadgear "H_HelmetB_light";
};*/
plyr_ldt = getUnitLoadout player;


////////////////////////////////////////// GeCo Intro //////////////////////////////////////////
[[ 
  ["Willkommen","<t align = 'center' shadow = '1' size = '1' font='PuristaBold'>%1</t>"], 
  ["bei der GeCo!","<t align = 'center' shadow = '1' size = '1' font='PuristaBold'>%1</t>"],
  [""],
  [""]
 ]] spawn BIS_fnc_typeText;
["img\loadingpic.paa"] spawn BIS_fnc_textTiles;	// show GeCo logo
////////////////////////////////////////// Intro complete //////////////////////////////////////////


// log end of execution
diag_log format ["%1 --- initPlayerLocal.sqf executed",diag_ticktime];