#include "component.hpp"

params ["_briefcase"];


private _action = ["grad_briefcase_pickup","Pick up","",{

    params ["_briefcase","_caller"];

    [_caller, false, _briefcase] remoteExec ["grad_briefcase_fnc_attachBriefcase", 2, false];

}, {
    isNull ((_this select 0) getVariable ["grad_briefcase_owner", objNull]) && 
    {isNull ((_this select 1) getVariable ["grad_briefcase_briefcase", objNull])}
}, {}, [], [0,0,0], 2] call ace_interact_menu_fnc_createAction;
[_briefcase, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;
