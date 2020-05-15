params [["_color", "#FFFFFF"]];

//Create black background
cutText ["","BLACK FADED", 999];

private _side = if (side player == west) then { true } else { false };
private _headerText =  format ["<t color='%1' size = '1.5'>", _color];
private _bodyText = format ["<t color='%1' size = '.8'>", _color];
private _breakLine = " <br />";
private _endStructuredText = " </t>";

private _text = [(format ["<t color='%1' size = '2'>CO Black Box", _color])];
_text pushBack (_headerText + " ");
if (_side) then {
    _text pushBack (_bodyText + "Side: BLUFOR");
    _text pushBack (_bodyText + "Faction: West Germany");
} else {
    _text pushBack (_bodyText + "Side: OPFOR");
    _text pushBack (_bodyText + "Faction: Poland");
};
_text pushBack (_bodyText + "Date: 25.05.1985");
_text pushBack (_bodyText + "Time: 09:30");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + "Lage:");
_text pushBack (_bodyText + "Am 24.05.1985 um 23:46 verlor das Area Traffic Control Centre Finland den kontakt zu einer US Air Force C130J die auf dem Weg nach Nordrussland war. An Bord befanden sich Diplomaten mehrerer Nationen, auf dem Weg zu einer Nuclear Reactor Thermal Hydraulics (NURETH) Conference in Murmansk, Russland.");
_text pushBack (_headerText + " ");
_text pushBack (_bodyText + "Der Absturz Punkt wird im Grenzstreifen zwischen Finnland und Russland vermutet, dieser wird von Separatisten besetzt, die ihren eigen Staat gründen wollen.");
_text pushBack (_headerText + " ");
if (_side) then {
    _text pushBack (_bodyText + "Sie sind als Teil einer NATO Übung in Finnland und waren die nächste verfügbar Einheit.");
} else {
    _text pushBack (_bodyText + "Sie sind als Teil einer UDSSR Übung in Finnland und waren die nächste verfügbar Einheit.");
};
_text pushBack (_headerText + " ");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + "Auftrag");
if (_side) then {
    _text pushBack (_bodyText + "Retten Sie die Diplomaten und sichern sie die Dokumente die diese dabei hatten. Gehen Sie davon aus, dass die Russen auch ein Rettungsteam schicken werden. Kooperieren Sie mit Ihnen falls notwendig, verhindern Sie aber unter allen umständen, das die Russen die Dokumente oder Diplomaten mit nehmen.");
} else {
    _text pushBack (_bodyText + "Retten Sie die Diplomaten und sichern sie die Dokumente die diese dabei hatten. Gehen Sie davon aus, dass die NATO auch Rettungstruppen schickt. Verhindern Sie, das es zu einem Bewaffneten konflikt mit der Nato kommt.");
};

private _fullText = _text joinString (_endStructuredText + _breakLine);

[
    _fullText,
    -1,
	safezoneY +1.8,
    30,
    1,
    -4
] spawn BIS_fnc_dynamicText;

[{cutText ["","BLACK IN", 0];},[],30] call CBA_fnc_waitAndExecute;