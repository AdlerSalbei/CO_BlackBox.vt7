
if !(isServer) exitWith {};

params [
    ["_date", date],
    ["_overcast", overcast],
    ["_rain", rain],
    ["_wind", [wind select 0, wind select 1, true]],
    ["_fog", fogParams]
];

setDate _date;
0 setOvercast _overcast;
0 setRain _rain;
setWind _wind;
0 setFog _fog;
[0, 0] remoteExec ["setRainbow"];

forceWeatherChange;