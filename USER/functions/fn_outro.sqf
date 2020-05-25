player allowDamage false;
[player, player] call ace_medical_treatment_fnc_fullHeal;

[{
	STHud_UIMode = 0;
	diwako_dui_main_toggled_off = true;

	cutText ["","BLACK OUT", 1];
	playMusic "outroMusic";

	player allowDamage false;

	[{
		cutText ["","BLACK FADED", 999];

		[{

			[] call GRAD_USER_fnc_closingCredits;

			if (isServer) then {

				private _chairs = [getPos firePlace, "Land_CampingChair_V2_F", (count (playableUnits + switchableUnits)) + 3] call GRAD_USER_fnc_chairCircle;
				[{
					params ["_chairs"];

					[_chairs] call GRAD_USER_fnc_seatPlayers;
				}, [_chairs], 1] call CBA_fnc_waitAndExecute;
			};
			[{
				cutText ["","BLACK IN", 5];
				10 fadeMusic 0;

				[{
					playMusic "";
					0 fadeMusic 1;
				}, [], 10] call CBA_fnc_waitAndExecute;
			}, [], 60] call CBA_fnc_waitAndExecute;
		}, [], 1] call CBA_fnc_waitAndExecute;
	}, [], 1] call CBA_fnc_waitAndExecute;
}, [], 1] call CBA_fnc_waitAndExecute;
