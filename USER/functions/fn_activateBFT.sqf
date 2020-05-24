private _allGroups = [];

{
	_allGroups pushBackUnique (group _x);		
} forEach playableUnits;

{
	_x setVariable ["ACE_map_hideBlueForceMarker", false, true];
} forEach _allGroups;