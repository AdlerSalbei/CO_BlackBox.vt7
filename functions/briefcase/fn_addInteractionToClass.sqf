_action = ["grad_briefcase_drop","Drop Briefcase","",{
    params ["_caller"];

    [_caller] remoteExec ["grad_briefcase_fnc_dropBriefcase", 2, false];

}, {(_this select 0) getVariable ["grad_briefcase_hasBriefcase", false]}] call ace_interact_menu_fnc_createAction;
["CAManBase",1,["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;



_action = ["grad_briefcase_give","Give Briefcase","",{
    params ["_unit", "_caller"];

    [_unit, false] remoteExec ["grad_briefcase_fnc_attachBriefcase", 2, false];

},{
    params ["_target","_caller"];

    _caller getVariable ["grad_briefcase_hasBriefcase", false] &&
    {isPlayer _target} &&
    {alive _target} &&
    {isNull objectParent _target}
}] call ace_interact_menu_fnc_createAction;
["CAManBase",0,["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;
