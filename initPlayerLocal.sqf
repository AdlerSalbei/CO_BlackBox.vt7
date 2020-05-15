if (didJIP) then {
    [player] remoteExec ["grad_common_fnc_addJipToZeus", 2, false];
};

["InitializePlayer", [player,true]] call BIS_fnc_dynamicGroups;
grad_template_ratingEH = player addEventHandler ["HandleRating",{0}];

private _markers = if (side player == west) then {
    ["marker_5", "marker_8"]
} else {
    ["marker_0", "marker_7"]
};

{
    _x setMarkerAlphaLocal 1;
}forEach _markers;

["CBA_loadingScreenDone", {
    [{time > (_this + 5)},{
            if (!(didJIP) || {(didJIP && !(isNil "GRAD_USER_introOver"))}) then {
            //if (isNull (getAssignedCuratorLogic player)) then {
                STHud_UIMode = 0;
                diwako_dui_main_toggled_off = true;
                [] call GRAD_USER_fnc_intro;
            //};
        };
    }, time] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
    

[
	"GRAD_seatPlayer", 
	{
		params ["_unit", "_chair"];
		
		[_chair, _unit] call acex_sitting_fnc_sit;
	}
] call CBA_fnc_addEventHandler;

if (player getVariable ["grad_side", "west"] isEqualTo "east") then {
    [player] joinSilent createGroup EAST;
};