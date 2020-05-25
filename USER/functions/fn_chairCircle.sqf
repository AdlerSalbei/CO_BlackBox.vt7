params ["_pos", ["_type", "Land_CampingChair_V2_F"], ["_count", count (playableUnits + switchableUnits)], ["_fire", nil]];

private _positions = [];
private _angle = 360/_count;
private _direction = 0;
private _temp = _type createVehicle [0,0,100];
private _chairBox = boundingBox _temp;
deleteVehicle _temp;
private _chairWidth = (abs (_chairBox # 0 # 0) + abs (_chairBox # 1 # 0)) + 0.5;
private _circleRadius = (_count * _chairWidth) / (2 * pi);

for "_i" from 1 to _count do {
	private _newPos = _pos getPos [(_circleRadius max 4), _direction];
	_positions pushBack _newPos;
	_direction = _direction + _angle;
};

private _chairs = [];

{
  	private _chair = createVehicle [_type, _x, [], 0, "CAN_COLLIDE"];
  	_chair setDir ((_chair getRelDir _pos) - 180);
  	_chairs pushBack _chair;
} forEach _positions;

if (isNil "_fire") then {
	createVehicle ["Land_Campfire_burning", _pos, [], 0, "CAN_COLLIDE"];
};

_chairs
