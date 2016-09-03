// Quentins Earplugs
/*
	Author: Quentin

	Description:
	add earplugs to player

	Parameter(s):
		0:
			OBJECT - player unit

	Returns:
	String
*/

/* To Do

- check if buttons already assigned to another important action
- fade speech and music too (not radio because important for ingame sound)
- make player move while toggling earplugs

*/
/* Notes

- Left Windows Key to toggle earplugs

*/


// set earplugs to "out" initially
player setVariable ["EarplugsIn",false];


// add EHs to unit
waituntil {!(isNull (findDisplay 46))};	// wait until main display is initialized
(findDisplay 46) displayAddEventHandler [
	"KeyDown",
	{
		// declare EH variables
		private _DIK = _this select 1;
		
		
		if (_DIK == 219) then	// when player presses assigned key...
		{
			if !(player getVariable "EarplugsIn") then	// ...if earplugs aren´t in yet...
			{
				0.1 fadeSound (soundVolume / 2);	// ...decrease sound volume by half...
				//0.1 fadeSpeech 0.25;
				//0.1 fadeMusic 0.25;
				["Ohrstöpsel eingesetzt.",1,0,3,0] spawn bis_fnc_dynamicText;
				player setVariable ["EarplugsIn",true]; // ...and set earplugs to "in"
			}
			else	// ...but if they are already in...
			{
				0.1 fadeSound (soundVolume * 2);	// ...double sound volume
				//0.1 fadeSpeech 1;
				//0.1 fadeMusic 1;
				["Ohrstöpsel entfernt.",1,0.1,3,0] spawn bis_fnc_dynamicText;
				player setVariable ["EarplugsIn",false];	// ...and set earplugs to "out"
			};
		};
	}
];


player addEventHandler [	// reset volume on players death
	"Respawn",
	{
		if !(player getVariable "EarplugsIn") then
		{
			0.1 fadeSound (soundVolume / 2);
			//0.1 fadeSpeech 0.25;
			//0.1 fadeMusic 0.25;
			player setVariable ["EarplugsIn",true];
		}
		else
		{
			0.1 fadeSound (soundVolume * 2);
			//0.1 fadeSpeech 1;
			//0.1 fadeMusic 1;
			player setVariable ["EarplugsIn",false];
		};
	}
];


// return
true;