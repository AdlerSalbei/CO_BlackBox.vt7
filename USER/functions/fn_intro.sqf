params [["_color", "#FFFFFF"]];

0 fadeSound 0.1;

playMusic ["introMusic", 0];
showChat false;

//Create black background
cutText ["","BLACK FADED", 999];

private _side = if (side player == west) then { true } else { false };
private _headerText =  format ["<t color='%1' size = '1.5'>", _color];
private _bodyText = format ["<t color='%1' size = '.8'>", _color];
private _breakLine = " <br />";
private _endStructuredText = " </t>";

private _text = [(format ["<t color='%1' size = '2'>CO Black Box", _color])];
_text pushBack (_headerText + " ");
if (_side) then {
    _text pushBack (_bodyText + "Side: BLUFOR");
    _text pushBack (_bodyText + "Faction: West Germany");
} else {
    _text pushBack (_bodyText + "Side: OPFOR");
    _text pushBack (_bodyText + "Faction: Poland");
};
_text pushBack (_bodyText + "Date: 25.05.1985");
_text pushBack (_bodyText + "Time: 04:00");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + "Lage:");
_text pushBack (_bodyText + "Am 24.05.1985 um 23:46 verlor das Area Traffic Control Centre Finland den Kontakt zu einer US Air Force C130J, die auf dem Weg nach Nordrussland war. An Bord befanden sich Diplomaten mehrerer Nationen, auf dem Weg zu einer Nuclear Reactor Thermal Hydraulics (NURETH) Conference in Murmansk, Russland.");
_text pushBack (_headerText + " ");
_text pushBack (_bodyText + "Die Absturzstelle wird im Grenzstreifen zwischen Finnland und Russland vermutet. Dieser wird von Separatisten besetzt, welche ihren eigenen Staat gründen wollen.");
_text pushBack (_headerText + " ");
if (_side) then {
    _text pushBack (_bodyText + "Als Teil einer NATO Übung in Finnland, sind Sie die nächste verfügbar Einheit.");
} else {
    _text pushBack (_bodyText + "Als Teil einer UDSSR Übung, nahe der finnischen Grenze, sind Sie die nächste verfügbar Einheit.");
};
_text pushBack (_headerText + " ");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + "Auftrag");
if (_side) then {
    _text pushBack (_bodyText + "Retten Sie die Diplomaten und sichern Sie deren Unterlagen. Gehen Sie davon aus, dass die Russen ebenfalls ein Rettungsteam schicken werden. Kooperieren Sie mit ihnen falls möglich, verhindern Sie aber unter allen Umständen, dass die Russen die Dokumente oder Diplomaten sicherstellen.");
} else {
    _text pushBack (_bodyText + "Retten Sie die Diplomaten und sichern Sie deren Unterlagen. Gehen Sie davon aus, dass die NATO ebenfalls Rettungstruppen schickt. Verhindern Sie, dass es zu einem bewaffneten Konflikt mit der NATO kommt.");
};

private _fullText = _text joinString (_endStructuredText + _breakLine);

[
    _fullText,
    -1,
	safezoneY +1.8,
    55,
    1,
    -4
] spawn BIS_fnc_dynamicText;

[{
    /*
    private _filmgrain = ppEffectCreate ["FilmGrain", 2000];
    _filmgrain ppEffectEnable true;
    _filmgrain ppEffectAdjust [0.3, 0.3, 0.12, 0.12, 0.12, true];
    _filmgrain ppEffectCommit 0;
    */

    private _camera = "camera" camCreate (getPos camPos_01);
    _camera camSetPos (getPos camPos_01);
    _camera camCommand "inertia on";
    _camera camSetTarget plane_1;
    _camera cameraEffect ["internal", "back"];
    _camera camSetFov 1;
    _camera camCommit 0;
    _camera camSetPos (getPos camPos_01);
    _camera camSetTarget plane_1;
    _camera camCommit 1;

    [{
        cutText ["","BLACK IN", 0];

        [{[getPos lightningPos] call GRAD_USER_fnc_doLightning;}, [], 1.5] call CBA_fnc_waitAndExecute;

        [{
            [ 
                parseText "<t font='PuristaBold' size='7' color='#000000'>CO Black Box </t>", 
                [ 
                    safezoneX + 0.31 * safezoneW, 
                    safezoneY + 0.35 * safezoneH, 
                    2, 
                    1 
                ], 
                nil, 
                3, 
                [4,0.5], 
                0 
            ] spawn BIS_fnc_textTiles;

            [{
                params ["_camera"];
                _camera camSetPos (getPos camPos_02);
                _camera camCommit 23;
                [{
                    [getPos lightningPos] call GRAD_USER_fnc_doLightning;
                }, [], 0.5] call CBA_fnc_WaitAndExecute;

                [{
                    [getPos lightningPos] call GRAD_USER_fnc_doLightning;
                }, [], 12] call CBA_fnc_WaitAndExecute;                

                [{
                    [getPos lightningPos] call GRAD_USER_fnc_doLightning;
                }, [], 18] call CBA_fnc_WaitAndExecute;                

                [{
                    params ["_camera"/*,"_filmgrain"*/];

                    /*
                    _filmgrain ppEffectEnable false;
                    ppEffectDestroy _filmgrain;
                    */
                    cutText ["","BLACK FADED", 0];

                    if (isNil "GRAD_USER_introOver") then {
                        GRAD_USER_introOver = true;
                        publicVariable "GRAD_USER_introOver";

                        ["GRAD_USER_introOver", [[1985, 5, 25, 4, 0], 0.5, 0, nil, [0.05,0.05,50]]] call CBA_fnc_serverEvent;
                    };                  

                    [{
                        cutText ["","BLACK IN", 10];
                        10 fadeSound 1;
                        [{
                            STHud_UIMode = 1;
                            diwako_dui_main_toggled_off = false;
                            showChat true;
                        }, [], 10] call CBA_fnc_waitAndExecute;
                    }, [], 3] call CBA_fnc_waitAndExecute;
                    
                    1.2 fadeMusic 0;
                    _camera cameraEffect ["terminate", "back"];
                    camDestroy _camera;

                    [{
                        playMusic "";
                        0 fadeMusic 1;
                    }, [], 10] call CBA_fnc_waitAndExecute
                }, _this, 24] call CBA_fnc_waitAndExecute;
            }, _this, 5] call CBA_fnc_waitAndExecute;
        }, _this, 5] call CBA_fnc_waitAndExecute;
    },[_camera/*, _filmgrain*/], 50] call CBA_fnc_waitAndExecute;
},[], 5] call CBA_fnc_waitAndExecute;