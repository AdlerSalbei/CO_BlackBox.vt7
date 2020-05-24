if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus", 2, false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

if (player getVariable ["grad_side", "west"] isEqualTo "east") then {
    [player] joinSilent createGroup EAST;
};


if !(didJIP) then {
    ["CBA_loadingScreenDone", {
        cutText ["","BLACK FADED", 999];
        0 fadeSound 0;
        showChat false;
        diwako_dui_main_toggled_off = true;
        [{time > (_this + 5)},{
                if (!(didJIP) || {(didJIP && !(isNil "GRAD_USER_introOver"))}) then {
                //if (isNull (getAssignedCuratorLogic player)) then {
                    STHud_UIMode = 0;
                    diwako_dui_main_toggled_off = true;                    

                    private _markers = ["marker_1", "marker_2", "marker_3", "marker_4"];
                    if (side player == WEST) then {
                        _markers append ["marker_5", "marker_8"];
                        ["BLU_F", "gm_westDeutschland", false] call GRAD_Loadout_fnc_FactionSetLoadout;
                    } else {
                        _markers append ["marker_0", "marker_7"];
                        ["BLU_F", "gm_poland", false] call GRAD_Loadout_fnc_FactionSetLoadout;
                    };

                    {
                        _x setMarkerAlphaLocal 1;
                    }forEach _markers;

                    [player] call GRAD_Loadout_fnc_doLoadoutForUnit;
                /*} else {
                    {
                        _x setMarkerAlphaLocal 1;
                    }forEach allMapMarkers;
                };*/
            };
        }, time] call CBA_fnc_waitUntilAndExecute;
    }] call CBA_fnc_addEventHandler;
};
  

[
	"GRAD_seatPlayer", 
	{
		params ["_unit", "_chair"];
		
		[_chair, _unit] call acex_sitting_fnc_sit;
	}
] call CBA_fnc_addEventHandler;


#include "\z\ace\addons\medical\functions\script_component.hpp"
//10% of the default Blood Volume as failsafe
#define MIN_BLOOD_VOL (BLOOD_VOLUME_FATAL + 0.15 * DEFAULT_BLOOD_VOLUME)

["unit", {
    params ["_newUnit", "_oldUnit"];

    // remove old perFrameHandler if there is one
    private _id = missionNamespace getVariable ["grad_bleedOutHandler", -1];
    if (_id > -1) then { [_id] call CBA_fnc_removePerFrameHandler; };

    private _isRemoteControlledUnit = false;
    {
        if (getAssignedCuratorUnit _x isEqualTo _newUnit) exitWith {
            _isRemoteControlledUnit = true;
            _isRemoteControlledUnit;
        };
    } forEach allCurators;

    // exit, if unit doesn't exist, or is remote-controlled
    if (isNull _newUnit || {_isRemoteControlledUnit}) exitWith {};
    
    private _handle = [{
        params ["_unit", "_handle"];
        //check if player is awake and bleeding
        if (!IS_UNCONSCIOUS(_unit) || {!IS_BLEEDING(_unit)}) exitWith {};
        //check if player falls below threshold and set threshold as new value
        if (GET_BLOOD_VOLUME(_unit) < MIN_BLOOD_VOL) then {
            // private _allCurators = [];
            // {
            //     _allCurators pushBackUnique (getAssignedCuratorUnit _x);     
            // } forEach allCurators;
            // [format["%1 fell below %2 litres of blood. Current level: %3 litres", name _unit, MIN_BLOOD_VOL, GET_BLOOD_VOLUME(_unit)]] remoteExec ["systemChat", _allCurators];
			_unit setVariable [VAR_BLOOD_VOL, MIN_BLOOD_VOL, true];
        };
    }, 5, _newUnit] call CBA_fnc_addPerFrameHandler;
    missionNamespace setVariable ["grad_bleedOutHandler", _handle];
}, true] call CBA_fnc_addPlayerEventHandler;

//Add Briefcase Interactions
[] call grad_briefcase_fnc_addInteractionToClass;


[{0 setRainbow 0;}, [], 10] call CBA_fnc_waitAndExecute;