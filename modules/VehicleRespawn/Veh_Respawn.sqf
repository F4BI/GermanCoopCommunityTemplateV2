// by Quentin


// declare given argument as local variable
_vehicle = _this select 0;


// add respawned vehicle to editable objects for all curators
{[_x,[[_vehicle],true]] remoteExec ["addCuratorEditableObjects",2]; nil;} count allCurators;


// add Veh_FiredEH
if (isNil "MPS_BaseMrkr") then	// if mission builder has placed a BaseMarker...
{
	_vehicle addEventHandler ["Fired",
	{
		if ((_vehicle distance (getMarkerpos "GeCo_MissionProtection_BaseMarker")) < 400) then
		{
			deleteVehicle (_this select 6);
			["<t color='#ff0000' size ='1.5'>Der Einsatz von Bordwaffen in der Basis ist gegen die Dienstvorschriften, Soldat!<br/>Sie wurden verwarnt.</t>",0,0,4,0] spawn BIS_fnc_dynamicText;
			[15] call GeCo_MissionProtection_AddFoul;
		};
	}];
}
else	// ...otherwise...
{
	if (!isNil "MPS_BaseMrkr") then	// ...if there is no object called "MPS_BaseMrkr"...
	{
		["<t color='#ff0000' size ='1.5'>Es gibt keinen BaseMarker!<br/>Erstelle ein Objekt namens ""MPS_BaseMrkr"" und platziere es ins Zentrum der Spielerbasis, damit das Schutzsystem arbeiten kann.</t>",0,0,4,0] spawn BIS_fnc_dynamicText;	// ...tell him
	};
};


// BLUFOR Striders
if (/*side co == "WEST" && {*/(typeOf _vehicle == "I_MRAP_03_hmg_F") or {typeOf _vehicle == "I_MRAP_03_gmg_F"}/*}*/) then
{
	[_vehicle,["Blufor",1],true] call BIS_fnc_initVehicle;
};


// initialize KK Stream UAV on respawned streaming_drone
if (str(_vehicle) == "streaming_drone") then
{
	if (!isNil "streaming_drone" && !isNil "whiteboard" && !isNil "drone_control") then {[streaming_drone,whiteboard,drone_control] remoteExecCall ["KK_fnc_StreamUAV",group co];};
};