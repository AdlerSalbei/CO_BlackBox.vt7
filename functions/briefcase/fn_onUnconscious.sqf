#include "component.hpp"

params ["_unit","_isUnconscious"];

if !(_isUnconscious) exitWith {};
if !(_unit getVariable ["grad_briefcase_hasBriefcase",false]) exitWith {};
private _briefcase = _unit getVariable ["grad_briefcase_briefcase", objNull];
[_unit, _briefcase] remoteExec ["grad_briefcase_fnc_dropBriefcase",2,false];
