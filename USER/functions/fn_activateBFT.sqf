private _allGroups = [];

{
	_allGroups pushBackUnique (group _x);		
} forEach playableUnits;

{
	_x setVariable ["ACE_map_hideBlueForceMarker", false, true];
} forEach _allGroups;


[{
	private _allGroups = [];

	{
		_allGroups pushBackUnique (group _x);		
	} forEach playableUnits;

	{
		_x setVariable ["ACE_map_hideBlueForceMarker", false, true];
	} forEach _allGroups;
}, 15, []] call CBA_fnc_addPerFrameHandler;