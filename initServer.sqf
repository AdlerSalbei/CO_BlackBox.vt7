["Initialize"] call BIS_fnc_dynamicGroups;

EAST setFriend [WEST, 1];
WEST setFriend [EAST, 1];

["GRAD_USER_introOver", {
	_this call grad_user_fnc_setTimeAndWeather;
	[] call grad_user_fnc_activateBFT;
	{
		// Current result is saved in variable _x
		deleteVehicle _x;
	} forEach (crew introTruck) + [introTruck];
}] call CBA_fnc_addEventHandler;

[getPosATL HelipadNotePosition1, getDir HelipadNotePosition1, "Leevi,                                            die Sache wird heikler als gedacht. Wir können die Diplomaten nicht im Grenzgebiet lassen. Niilo hat eine Idee, wie wir sie samt Dokumente vom Festland bekommen. Aber wir brauchen mehr Zeit. Ich fahre die Diplomaten jetzt runter nach Vilkkilä. Lenni und Joel haben die Grenzen im Auge. Halte die Deutschen und Sowjets solange auf wie du kannst. Wir waren unserem Ziel noch nie so nahe und ein derartiges Druckmittel fällt uns kein zweites Mal in die Hände!         Varo, veli.", ["quite", ["messy","PuristaBold"]]] call GRAD_leaveNotes_fnc_spawnNote;

[
	{
		private _allPlayers = [];
		{
			if (isPlayer _x && {isNull (getAssignedCuratorLogic _x)}) then {
				_allPlayers pushBackUnique _x;
			};
		}forEach playableUnits + switchableUnits;

		[
			{
				[] call GRAD_USER_fnc_intro;
			}
		] remoteExecCall ["call", _allPlayers];
	}, 
	[], 
	15
] call CBA_fnc_waitAndExecute;