#include "component.hpp"

params [["_unit",objNull]];

if (_unit getVariable ["grad_briefcase_hasBriefcase",false]) then {
    private _briefcase = _unit getVariable ["grad_briefcase_briefcase", objNull];
    [_unit, _briefcase] call grad_briefcase_fnc_dropBriefcase;
};


false
