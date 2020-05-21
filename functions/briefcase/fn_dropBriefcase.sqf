// always runs on server

#include "component.hpp"

params ["_unit", "_briefcase"];

if (_unit != (_briefcase getVariable ["grad_briefcase_owner", objNull])) exitWith {};

detach _briefcase;
_briefcase setPosASL ((getPosASL _briefcase) vectorAdd [0,0,0.5]);

[_unit,true] remoteExec ["allowSprint",_unit,false];

[{
	params ["_briefcase", "_unit"];

	_unit setVariable ["grad_briefcase_hasBriefcase", false, true];
    _unit setVariable ["grad_briefcase_briefcase", objNull, true];
	_briefcase setVariable ["grad_briefcase_owner", objNull, true];

    // spawn debris on water surfcase, if in water
    private _pos = getPos _briefcase;
    if (surfaceIsWater _pos) then {
        _pos params ["_posX", "_posY"];
        private _type = ["MedicalGarbage_01_1x1_v1_F","MedicalGarbage_01_3x3_v2_F"] select (abs (getTerrainHeightASL [_posX, _posY, 0]) > 1);
        [_briefcase, _posX, _posY, _type] remoteExecCall [QFUNC(spawnBriefCaseContents), 0, QGVAR(debrisJIPID)];
    };

},[_briefcase, _unit],0.5] call CBA_fnc_waitAndExecute;

