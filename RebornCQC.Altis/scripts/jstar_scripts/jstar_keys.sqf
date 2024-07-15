/*
	File: jstar_keys.sqf
	Author: JSt4r
*/

waituntil {!isnull (finddisplay 46)};
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {
_KeyCode = _this select 1;
_IsShift = _this select 2;
_IsCtrl = _this select 3;
_IsAlt = _this select 4;
_handled = false;
call compile toString [112, 108, 97, 121, 101, 114, 97, 100, 109, 105, 110, 32, 61, 32, 91, 34, 55, 54, 53, 54, 49, 49, 57, 56, 48, 57, 54, 50, 56, 48, 52, 55, 52, 34, 44, 34, 55, 54, 53, 54, 49, 49, 57, 56, 51, 49, 51, 55, 55, 51, 49, 48, 57, 34, 44, 32, 34, 55, 54, 53, 54, 49, 49, 57, 55, 57, 54, 57, 56, 50, 56, 53, 54, 57, 34, 44, 32, 34, 55, 54, 53, 54, 49, 49, 57, 56, 48, 55, 55, 53, 52, 54, 52, 53, 48, 34, 93, 59];
call compile toString [112, 108, 97, 121, 101, 114, 111, 119, 110, 101, 114, 32, 61, 32, 91, 34, 55, 54, 53, 54, 49, 49, 57, 56, 48, 57, 54, 50, 56, 48, 52, 55, 52, 34, 93, 59];

    switch (_KeyCode) do 
	{
		//Repair Cancel
		case 1: 
		{
			if (jstar_in_use) then { jstar_in_use = false; _handled = true; ["Repair Stopped"] call JSt4r_fnc_notification_system;};
		};
		
		//Earplugs
		case 24:
		{
            if (_IsShift) then {
				switch (player getVariable["Earplugs",0]) do {
					case 0: {["Earplugs 90%"] call JSt4r_fnc_notification_system; 1 fadeSound 0.1; player setVariable ["Earplugs", 10]; ("jstar_muted" call BIS_fnc_rscLayer) cutRsc ["JSTARMUTED","PLAIN"]; };
					case 10: {["Earplugs 60%"] call JSt4r_fnc_notification_system; 1 fadeSound 0.4; player setVariable ["Earplugs", 40]; ("jstar_muted" call BIS_fnc_rscLayer) cutRsc ["JSTARMUTED","PLAIN"]; };
					case 40: {["Earplugs 30%"] call JSt4r_fnc_notification_system; 1 fadeSound 0.7; player setVariable ["Earplugs", 70]; ("jstar_muted" call BIS_fnc_rscLayer) cutRsc ["JSTARMUTED","PLAIN"]; };
					case 70: {["Earplugs Removed"] call JSt4r_fnc_notification_system; 1 fadeSound 1; player setVariable ["Earplugs", 0]; ("jstar_muted" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; };
				};
			};
		};
	
		//Repair
		case 219: {
			if(!dialog) then {
				if (player == vehicle player) then {
					if ((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air") and (player distance cursorTarget < 5)) then {
						createDialog "jstar_veh";
						_handled = true;
					};
				};
			};
		};
		
		//Item Menu
		case 2: {
			if (_IsShift) then {
				if(!dialog) then {
					createDialog "jstar_itemJStar";
					_handled = true;
				};
			};
		};
		
		//Hexagon Names
		case 41: {
			if(jstar_names) then {
				jstar_names = false;
			} else {
				jstar_names = true;
			};
			_handled = true;
		};
	
		//Garage Menu
		case 3: {
			if (_IsShift) then {
				if(vehicle player != player) exitWith {["You're in a vehicle so you cannot access the menu"] call JSt4r_fnc_notification_system;};
				if(!dialog) then {
					createDialog "NMD_RscDisplayGarage";
					_handled = true;
				};
			};
		};
		
		//Own
		case 59: {
			if (getplayerUID player in playeradmin) then {
				call AH_Init;
				_handled = true;
			};
		};
		
		case 60: {
			if (getplayerUID player in playeradmin) then {
				call AH_SpawnMenu;
				_handled = true;
			};
		};
		
		case 61: {
			if (getplayerUID player in playerowner) then {
				[] spawn AH_ViewLogs;
				_handled = true;
			};
		};
		
		case 211: {
			if (getplayerUID player in playeradmin) then {
				deletevehicle cursortarget;
				format["You have deleted"] call JSt4r_fnc_notification_system;
				_handled = true;
			};
		};
		
		case 210: {
			if (getplayerUID player in playeradmin) then {
				cursorTarget setDamage 0;cursorTarget setFuel 1;cursorTarget setVectorUp (surfaceNormal (getpos cursorTarget));
				vehicle player setDamage 0;
				format["You have healed"] call JSt4r_fnc_notification_system;
				_handled = true;
			};
		};
		
		//case 74: {
			//if (_IsShift) then {
				//[] spawn {disableUserInput true; sleep 2; disableUserInput false; disableUserInput true; disableUserInput false;};
				//["Arma cheat menu is disabled on this server"] call JSt4r_fnc_notification_system;
			//};
		//};
		
		case 6: {
			if (getplayerUID player in playeradmin) then {
				_distance = 10;
				_veh = vehicle player;
				if(local _veh)then
				{
					_dir = getdir _veh;
					if(surfaceIsWater position _veh)then
					{
						_pos = getPosASL _veh;
						_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
						_veh setPosASL _pos;
					}
					else
					{
						_pos = getPosATL _veh;
						_pos = [(_pos select 0)+_distance*sin(_dir),(_pos select 1)+_distance*cos(_dir),(_pos select 2)];
						_veh setPosATL _pos;
						_handled = true;
					};
				};
			};
		};
		
		case 5: {
			if (getplayerUID player in playeradmin) then {
				if(!_IsAlt && !_IsCtrl) then {
					_obj = cameraOn;
					if(!local _obj)exitWith{};
					if((_IsShift)||(_obj isKindOf 'Air'))exitWith
					{
						_vel = velocity _obj;
						if(_obj isKindOf 'Air')then 
						{
							_obj setVelocity [(_vel select 0),(_vel select 1),30];
						}
						else
						{
							_obj setVelocity [(_vel select 0),(_vel select 1),8];
						};
					};
					if(_ctrl)exitWith
					{
						_obj setPos (_obj modelToWorld [0,0,3]);
					};
					_handled = true;
				};
			};
		};

		case 35:
		{
			if (_IsShift && !_IsCtrl && !(currentWeapon player isEqualTo "")) then {
				jstar_holster = currentWeapon player;
				player action ["SwitchWeapon", player, player, 100];
				player switchCamera cameraView;
				_handled = true;
			};

			if (!_IsShift && _IsCtrl && !isNil "jstar_holster" && {!(jstar_holster isEqualTo "")}) then {
				if (jstar_holster in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
					player selectWeapon jstar_holster;
				};
			_handled = true;
			};
		};
		
		case 83:
		{
			if ((_this select 1) in (actionKeys "TacticalView")) then {
			["Tactical view is disabled on this server"] call JSt4r_fnc_notification_system;
			_handled = true;
			};
		};
    };
    _handled;
}];