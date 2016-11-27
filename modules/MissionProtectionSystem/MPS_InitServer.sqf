// by Fabi, edited by Quentin


// disable vehicles firing in base
if (isNil "MPS_BaseMrkr") then	// if mission builder has placed a BaseMarker...
{
	Veh_FiredEH = {_x addEventHandler ["Fired",
	{
		if (((_this select 0) distance (getMarkerpos "MPS_BaseMrkr")) < 400) then	// if someone shoots from a vehicle inside base...
		{
			deleteVehicle (_this select 6);	// ...delete the projectile
			["<t color='#ff0000' size ='1.5'>Der Einsatz von Bordwaffen in der Basis ist gegen die Dienstvorschriften, Soldat!<br/>Sie wurden verwarnt.</t>",0,0,4,0] spawn BIS_fnc_dynamicText;	// ...warn him
			[15] call MPS_fnc_AddFoul;	// ...increase his foul counter
		};
	}];
	nil
	} count vehicles;
}
else	// ...otherwise...
{
	if (!isNil "MPS_BaseMrkr") then	// ...if there is no object called "MPS_BaseMrkr"...
	{
		["<t color='#ff0000' size ='1.5'>Es gibt keinen BaseMarker!<br/>Erstelle ein Objekt namens ""MPS_BaseMrkr"" und platziere es ins Zentrum der Spielerbasis, damit das Schutzsystem arbeiten kann.</t>",0,0,4,0] spawn BIS_fnc_dynamicText;	// ...tell him
	};
};