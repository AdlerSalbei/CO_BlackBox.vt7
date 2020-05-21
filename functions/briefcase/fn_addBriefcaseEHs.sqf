#include "component.hpp"

if (isServer) then {
    addMissionEventHandler ["HandleDisconnect",grad_briefcase_fnc_onDisconnect];
};

if (!hasInterface) exitWith {};

{
    if (local _x) then {
        _x addEventhandler ["GetInMan",grad_briefcase_fnc_onGetIn];
        _x addEventhandler ["GetOutMan",grad_briefcase_fnc_onGetOut];
        _x addEventhandler ["Killed",grad_briefcase_fnc_onKilled];
        _x addEventhandler ["AnimChanged",grad_briefcase_fnc_onAnimChanged];
    };
} forEach allUnits;

["weapon", grad_briefcase_fnc_onWeaponChanged] call CBA_fnc_addPlayerEventHandler;
["ace_unconscious", grad_briefcase_fnc_onUnconscious] call CBA_fnc_addEventHandler;
