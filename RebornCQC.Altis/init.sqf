/*
	File: jstar_server.sqf
	Author: JSt4r
*/

["Initialize"] call BIS_fnc_dynamicGroups;

MISSION_ROOT = call {
    private "_arr";
    _arr = toArray __FILE__;
    _arr resize (count _arr - 8);
    toString _arr
};

execVM "scripts\jstar_scripts\ServerInfoMenu\sqf\initLocal.sqf";