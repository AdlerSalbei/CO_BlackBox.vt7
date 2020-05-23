params ["_pos"];

/*
//--- Play sound (tied to the explosion effect)
private _bolt = createVehicle ["LightningBolt", _pos, [], 0, "CAN_COLLIDE"];
_bolt setPosATL _pos;
_bolt setDamage 1;
*/

private _light = "#lightpoint" createVehicleLocal _pos;
_light setPosATL (_pos vectorAdd [0, 0, 10]);
_light setLightDayLight true;
_light setLightBrightness 300;
_light setLightAmbient [0.05, 0.05, 0.1];
_light setLightColor [1, 1, 2];

//Play thunder sound
playSound (selectRandom ["thunder_1", "thunder_2"]);

[{
	params ["_light"];

	_light setLightBrightness 0;

	[{
		params ["_light"];

		private _lightning = (selectRandom ["lightning1_F","lightning2_F"]) createVehicleLocal [100, 100, 100];
		_lightning setDir random 360;
		_lightning setPos _pos;

		[{
			params ["_light"];

			_light setLightBrightness (100 + random 100);

			[{
				params ["_light", "_lightning"];

				deleteVehicle _lightning;
				deleteVehicle _light;

				//--- Disable engine lightnings
				0 setLightnings 0;
			}, _this, 0.28] call CBA_fnc_waitAndExecute;
		}, [_light, _lightning], 0.1] call CBA_fnc_waitAndExecute;
	}, _this, (random 0.1)] call CBA_fnc_waitAndExecute;
}, [_light], 0.2] call CBA_fnc_waitAndExecute;