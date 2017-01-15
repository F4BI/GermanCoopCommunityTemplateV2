// Quentins Earplugs
/*
	Author: Quentin

	Description:
	add earplugs to player

	Parameter(s):
		0:
			OBJECT - player unit

	Returns:
	true
*/
/* To Do

- check if button is already assigned to another important action
- fade speech too (not radio because important for ingame sound)
- make player play a move while toggling earplugs

*/
/* Notes

- Right Windows Key to toggle earplugs (also usable by laptop players)

*/


// set earplugs to "out" initially
player setVariable ["EarplugsIn",false,false];


// add EHs to unit
waituntil {!(isNull (findDisplay 46))};	// wait until main display is initialized
QT_Earplugs_Display_EH = (findDisplay 46) displayAddEventHandler [
	"KeyDown",
	{
		// declare EH variables
		private _DIK = _this select 1;
		
		
		if (_DIK isEqualTo 220) then	// when player presses assigned key...
		{
			if !(player getVariable "EarplugsIn") then	// ...if earplugs aren´t in yet...
			{
				0.1 fadeSound (soundVolume / 5);	// ...decrease sound volume...
				//0.1 fadeSpeech 0.25;
				0.1 fadeMusic (musicVolume / 5);	// ...decrease music volume...
				["Ohrstöpsel eingesetzt.",1,0,3,0] spawn BIS_fnc_dynamicText;
				player setVariable ["EarplugsIn",true,false]; // ...and set earplugs to "in"
			}
			else	// ...but if they are already in...
			{
				0.1 fadeSound (soundVolume * 5);	// ...reset sound volume
				//0.1 fadeSpeech 1;
				0.1 fadeMusic (musicVolume * 5);	// ...reset music volume
				["Ohrstöpsel entfernt.",1,0,3,0] spawn BIS_fnc_dynamicText;
				player setVariable ["EarplugsIn",false,false];	// ...and set earplugs to "out"
			};
		};
	}
];


QT_Earplugs_Respawn_EH = player addEventHandler [	// reset volume on players death
	"Respawn",
	{
		if !(player getVariable "EarplugsIn") then
		{
			0.1 fadeSound (soundVolume / 5);	// ...decrease sound volume...
			//0.1 fadeSpeech 0.25;
			0.1 fadeMusic (musicVolume / 5);	// ...decrease music volume...
			player setVariable ["EarplugsIn",true];
		}
		else
		{
			0.1 fadeSound (soundVolume * 5);	// ...reset sound volume
			//0.1 fadeSpeech 1;
			0.1 fadeMusic (musicVolume * 5);	// ...reset music volume
			player setVariable ["EarplugsIn",false];
		};
	}
];


// create diary entry explanation
player createDiarySubject ["Ohrstöpsel","Ohrstöpsel"];
player createDiaryRecord [
	"Ohrstöpsel",
	[
		"Info",
			"<br/><font color='#107b1b'>Rechte Windows-Taste</font color> auf der Tastatur, um die Ohrstöpsel umzuschalten."
	]
];


// return
true;