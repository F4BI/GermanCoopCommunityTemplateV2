// by Fabi


class CheckCurator
{
	idd = 1500;
	class controls
	{
		class GeCo_CheckCurator_Background : GeCo_RscText
		{
			y = "SafeZoneY + (270.000000000001 / 1080) * SafeZoneH";
			x = "SafeZoneX + (510 / 1920) * SafeZoneW";
			w = "(740.000000000001 / 1920) * SafeZoneW";
			h = "(285.000000000001 / 1080) * SafeZoneH";
			text = "";
			colorBackground[] = {0, 0, 0, 0.7};
		};
		class GeCo_CheckCurator_RscText : GeCo_RscText
		{
			text = "Dies ist ein Zeusslot. Bitte Passwort eingeben:";
			x = "SafeZoneX + (577.5 / 1920) * SafeZoneW";
			y = "SafeZoneY + (317.5 / 1080) * SafeZoneH";
			w = "(558.999999999999 / 1920) * SafeZoneW";
			h = "(31 / 1080) * SafeZoneH";
		};
		class GeCo_CheckCurator_RscEdit : GeCo_RscEdit
		{
            idc = 1600;
			text = "";
			canModify = 1;
			x = "SafeZoneX + (575.000000000001 / 1920) * SafeZoneW";
			y = "SafeZoneY + (394.04 / 1080) * SafeZoneH";
			w = "(288.999999999999 / 1920) * SafeZoneW";
			h = "(31 / 1080) * SafeZoneH";
		};
		class GeCo_CheckCurator_Submit : GeCo_RscButton
		{
            idc = 1700;
			colorBackground[] = {0, 0, 0, 0.9};
			w = "(109 / 1920) * SafeZoneW";
			h = "(31 / 1080) * SafeZoneH";
			y = "SafeZoneY + (469.04 / 1080) * SafeZoneH";
			text = "Bestätigen";
			x = "SafeZoneX + (633 / 1920) * SafeZoneW";
            action = "if(ctrlText 1600 == ""Zeus"") then {PW_correct = true} else {PW_correct = false}; closeDialog 0;";
		};
	};
};