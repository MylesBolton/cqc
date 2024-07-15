/*
	File: travel_Move.sqf
	Author: JSt4r
*/

disableSerialization;

_selection = _this select 0;
_index = _selection select 1;

switch (_index) do {

		case 0 : {
			closeDialog 500;
			if(vehicle player != player) exitWith {["You're in a vehicle so you cannot access the menu"] call JSt4r_fnc_notification_system;};
			createDialog "NMD_RscDisplayGarage";
		};
		
		case 1 : {
			closeDialog 500;
			createDialog "jstar_items";
		};
		
		case 2 : {
			_PlayerGrass = player getVariable ["isGrass", false];

			if (!_PlayerGrass) then
			{
				setTerrainGrid 50;
				player setVariable ["isGrass", true, true];
				("jstar_nograss" call BIS_fnc_rscLayer) cutRsc ["JSTARGRASS","PLAIN"];
				["Grass Off"] call JSt4r_fnc_notification_system;
			}
			else
			{
				setTerrainGrid 48.99;
				player setVariable ["isGrass", false, true];
				("jstar_nograss" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
				["Grass On"] call JSt4r_fnc_notification_system;
			};
		};
		
		case 3 : {
			jstar_bag = player getVariable ["jstar_isbag", false];
			
			if (!jstar_bag) then
			{
                (unitbackpack player) hideObjectGlobal true;
				player setVariable ["jstar_isbag", true, true];
				["Backpack Hidden"] call JSt4r_fnc_notification_system;
				jstar_isbag = player addEventHandler ["Respawn",
				{
					[] spawn {sleep 0.1;(unitbackpack player) hideObjectGlobal true};
				}];
            }
            else
            {
				player removeEventHandler ["Respawn", jstar_isbag];
                (unitbackpack player) hideObjectGlobal false; 
				player setVariable ["jstar_isbag", false, true];
                ["Backpack Showing"] call JSt4r_fnc_notification_system;
            };
		};
	};