/*
	File: trave_Menu.sqf
	Author: JSt4r
*/

disableSerialization;

_listbox = 518;

{ _index = lbAdd [_listbox, _x];} forEach [ 
		"Vehicles",
		"Items",
		"Toggle Grass",
		"Toggle Backpack"
	];