["Initialize"] call BIS_fnc_dynamicGroups;

EAST setFriend [WEST, 1];
WEST setFriend [EAST, 1];

["GRAD_USER_introOver", {
	_this call grad_user_fnc_setTimeAndWeather;
	{
		// Current result is saved in variable _x
		deleteVehicle _x;
	} forEach (crew introTruck) + [introTruck];
}] call CBA_fnc_addEventHandler;

[getPos HelipadNotePositon1, getDir HelipadNotePositon1, "Ich bin eine Testnachricht", ]