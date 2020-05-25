params [["_color", "#FFFFFF"]];

//Create black background
cutText ["","BLACK FADED", 999];

//Create Text
private _headerText =  format ["<t color='%1' size = '1.5'>", _color];
private _bodyText = format ["<t color='%1' size = '.8'>", _color];
private _breakLine = " <br />";
private _endStructuredText = " </t>";

private _text = [(format ["<t color='%1' size = '2'>Abspann", _color])];
private _return = [_headerText + "Zeus" + _bodyText];
private _number = 0;
{
    if (!(isNull (getAssignedCuratorUnit _x)) && !(str _x in ["zeusModule_adminLogged", "zeusModule_adminVoted"])) then {
        _number = _number +1;
        _return pushBack (format["Zeus %1: %2", _number, name (getAssignedCuratorUnit _x)]);
    };
}forEach allCurators;

if (count _return > 1) then {
    _text pushBack (_return joinString _breakLine);
    _text pushBack (_headerText + " ");
};

_text pushBack (_headerText + "Songs");
_text pushBack (_bodyText + "Intro: Karri Neenberg - Scorched Earth");
_text pushBack (_bodyText + "Outro: Hans Zimmer - End Titles");
_text pushBack (_headerText + " ");

_text pushBack (_headerText + "Dankesagung");
_text pushBack (_bodyText + "Vielen Dank an Bohemia Interactiv, für das großartige Spiel.");
_text pushBack (_bodyText + "Vielen Dank an Jules, für die großartigen Deutsch Kenntnisse.");
_text pushBack (_headerText + " ");

_text pushBack (_headerText + "Helden des Abends");
_text pushBack (_headerText + "Blufor");
_return = [];

private _groups = ["GetAllGroupsOfSide", [WEST]] call BIS_fnc_dynamicGroups;

{
    if (side _x isEqualTo WEST) then {
        private _group = _x;
        _return pushBack " ";
        _return pushBack (format ["<t color='%1' size = '1'>", _color] + (groupId _group) + _endStructuredText + _bodyText);
        {
            private _description = roleDescription _x;
            if (_description == "") then {
                _description = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
            };

            private _split = _description splitString "@";
            if (count _split > 1) then {
                _description = _split select 0;
            };
            _return pushBack (format ["%1: %2", _description, name _x]);
        }forEach (units _group);
    };
} forEach _groups;

_text pushBack (_bodyText + (_return joinString _breakLine));
_return = [];
_groups = [];
_text pushBack (_headerText + " ");
_text pushBack (_headerText + " ");
_text pushBack (_headerText + "Opfor");
_groups = ["GetAllGroupsOfSide", [EAST]] call BIS_fnc_dynamicGroups;

{
    if (side _x isEqualTo EAST) then {
        private _group = _x;
        _return pushBack " ";
        _return pushBack (format ["<t color='%1' size = '1'>", _color] + (groupId _group) + _endStructuredText + _bodyText);
        {
            private _description = roleDescription _x;
            if (_description == "") then {
                _description = getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName");
            };

            private _split = _description splitString "@";
            if (count _split > 1) then {
                _description = _split select 0;
            };
            _return pushBack (format ["%1: %2", _description, name _x]);
        }forEach (units _group);
    };
} forEach _groups;

_text pushBack (_bodyText + (_return joinString _breakLine));

private _fullText = _text joinString (_endStructuredText + _breakLine);

//Create Dynamic Text
[
    _fullText,
    -1,
	safezoneY +1.8,
    60,
    1,
    -4
] spawn BIS_fnc_dynamicText;
