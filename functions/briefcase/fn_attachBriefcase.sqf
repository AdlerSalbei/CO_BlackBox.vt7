#include "component.hpp"

params [["_unit", objNull], ["_vehicleMode", false], ["_briefcase", objNull]];

if (isNull _unit || isNull _briefcase) exitWith {ERROR_1("Object to attach to is null.",_unit)};
if !(isNull (_unit getVariable ["grad_briefcase_briefcase", objNull])) exitWith {};

private _prevOwner = _briefcase getVariable ["grad_briefcase_owner", objNull];
if (!isNull _prevOwner) then {
    _prevOwner setVariable ["grad_briefcase_hasBriefcase",false,true];
    [_prevOwner, true] remoteExec ["allowSprint", _unit, false];
};

if (_vehicleMode) then {
    _briefcase attachTo [vehicle _unit,[0,0,-100]];
} else {
    _briefcase attachTo [_unit,[-0.03,-0.06,-0.19],"RightHand"];
};
_briefcase setVectorDirAndUp [[1,0,0],[0,0,1]];

[_unit, false] remoteExec ["allowSprint", _unit, false];
_unit setVariable ["grad_briefcase_hasBriefcase", true, true];
_unit setVariable ["grad_briefcase_briefcase", _briefcase, true];
_briefcase setVariable ["grad_briefcase_owner", _unit, true];

if (currentWeapon _unit != "") then {
    [_unit,["SwitchWeapon", _unit, _unit, 999]] remoteExec ["action", _unit, false];
};
