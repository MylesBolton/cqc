/*
	File: travel_Move.sqf
	Author: JSt4r
*/

disableSerialization;

_selection = _this select 0;
_index = _selection select 1;

switch (_index) do {

		case 0 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_og.sqf";
		};
		
		case 1 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_church.sqf";
		};

		case 2 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_airport.sqf";
		};	
		
		case 3 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_fed.sqf";
		};
		
		case 4 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_lab.sqf";
		};
		
		case 5 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_mushroom.sqf";
		};
		
		case 6 : {
			closeDialog 1;
			execVM "scripts\jstar_teleport\jstar_spawns\jstar_apd.sqf";
		};
	};
	