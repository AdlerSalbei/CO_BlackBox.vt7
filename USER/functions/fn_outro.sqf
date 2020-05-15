[{
STHud_UIMode = 0;
diwako_dui_main_toggled_off = true;

cutText ["","BLACK OUT", 1];

[{
cutText ["","BLACK FADED", 999];

[{
titleText [format["<t font='PuristaBold' size='3'>Am 21.10.2019 Liesen %1 Helden ihr leben bei der Verteidigung des Präsidenten Livonias</t>", ({isNull (getAssignedCuratorLogic _x)} count allPlayers)], "PLAIN", 1, true, true];
[{

[] call GRAD_USER_fnc_closingCredits;

if (isServer) then {

private _chairs = [getPos firePlace, 5, "Land_CampingChair_V2_F", (count (playableUnits + switchableUnits)) + 3] call GRAD_USER_fnc_chairCircle;
[{
params ["_chairs"];

[_chairs] call GRAD_USER_fnc_seatPlayers;
}, [_chairs], 1] call CBA_fnc_waitAndExecute;
};
[{
cutText ["","BLACK IN", 1];
10 fadeMusic 0.05;

[{
5 fadeMusic 0;
}, [], 10] call CBA_fnc_waitAndExecute;
}, [], 20] call CBA_fnc_waitAndExecute;
}, [], 12] call CBA_fnc_waitAndExecute;
}, [], 1] call CBA_fnc_waitAndExecute;
}, [], 1] call CBA_fnc_waitAndExecute;
}, [], 3] call CBA_fnc_waitAndExecute;
