Admin_List = compileFinal "['76561198096280474','76561198313773109','76561198045611076','76561198175217931','76561197969828569','76561198077546450']";

/* End Configuration */

_toCompilableString = {
	_code = _this select 0;
	_string = "";
	if(typename _code == "CODE") then {
		_string = str(_code);
		_arr = toArray(_string);
		_arr set[0,32];
		_arr set[count(_arr)-1,32];
		_string = toString(_arr);
	};
	_string;
};
AH_AdminCheck = {
	_object = _this;
	_isAdmin = if(getplayeruid _object in (call Admin_List)) then {true} else {false};
	_isAdmin;
};
AH_AdminCheck = compileFinal ([AH_AdminCheck] call _toCompilableString);
if(isNil "AH_fnc_MP") then {
	AH_fnc_MP = compileFinal ([BIS_fnc_MP] call _toCompilableString);
};
if(isServer) then {
	AH_Menu_DoSpawn = {
		_object = _this select 0;
		_vehicle = _this select 1;
		_pos = _this select 2;
		_dir = _this select 3;

		if(_object call AH_AdminCheck) then {
			_v = _vehicle createVehicle _pos;
			_v setDir _dir;
			_v setPos _pos;
			format["%1 has created the vehicle '%2' at the position %3",name _object,_vehicle,_pos] call SERVER_LOG;
		};
	};
	AH_Menu_DoTP = {
		_pos = _this select 1;
		_object = _this select 0;

		if(_object call AH_AdminCheck) then {
			_object setpos _pos;
			format["%1 has teleported to %2",name _object,_pos] call SERVER_LOG;
		};
	};
	AH_TP_Here = {
		_admin = _this select 0;
		_target = _this select 1;

		if(_admin call AH_AdminCheck) then {
			_target setpos (getpos _admin);
			format["%2 has teleported %1 to him",name _target,name _admin] call SERVER_LOG;
			[{["Teleported the target to you"] call JSt4r_fnc_notification_system;},"BIS_fnc_Spawn",_admin,false] call AH_fnc_MP;
		};
	};
	AH_TP_Me = {
		_admin = _this select 0;
		_target = _this select 1;

		if(_admin call AH_AdminCheck) then {
			_admin setpos (getpos _target);
			format["%1 has teleported himself to %2",name _admin,name _target] call SERVER_LOG;
			[{["Teleported to the target"] call JSt4r_fnc_notification_system;},"BIS_fnc_Spawn",_admin,false] call AH_fnc_MP;
		};
	};
	AH_Menu_TPAHere = {
		_object = _this;
		if(_object call AH_AdminCheck) then {
			_pos = getposatl _object;
			{
				_x setposatl _pos;
			} forEach playableUnits;
			format["%1 has teleported everyone to himself!",name _object] call SERVER_LOG;
			[{["All players have been teleported"] call JSt4r_fnc_notification_system;},"BIS_fnc_Spawn",_object,false]call AH_fnc_MP;
		};
	};
	AH_Menu_Kick = {
		_sender = _this select 0;
		_receiver = _this select 1;
		if(_sender call AH_AdminCheck) then {
			format["%1 has kicked %2",name _sender,name _receiver] call SERVER_LOG;
			[{endMission "FAIL";},"BIS_fnc_Spawn",_receiver,false] call AH_fnc_MP;
			[{["Target kicked"] call JSt4r_fnc_notification_system;},"BIS_fnc_Spawn",_sender,false] call AH_fnc_MP;
		};
	};
	AH_Menu_Input = {
		_sender = _this select 0;
		_receiver = _this select 1;
		_allow = _this select 2;
		if(_sender call AH_AdminCheck) then {
			format["%1 has set %2's input to %3",name _sender,name _receiver,_allow] call SERVER_LOG;
			if(_allow) then {
				[{disableUserInput false;},"BIS_fnc_Spawn",_receiver,false] call AH_fnc_MP;
				[{["Targets input enabled"] call JSt4r_fnc_notification_system;},"BIS_fnc_Spawn",_sender,false] call AH_fnc_MP;
			} else {
				[{disableUserInput true;},"BIS_fnc_Spawn",_receiver,false] call AH_fnc_MP;
				[{["Targets input disabled"] call JSt4r_fnc_notification_system;},"BIS_fnc_Spawn",_sender,false] call AH_fnc_MP;
			};
		};
	};
	SERVER_LOG = {
		_message = _this;
		_message = format["<%1>: %2",serverTime,_message];
		LOG_LIST = LOG_LIST + [_message];
	};
	REQUEST_LOGS = {
		_object = _this;
		_owner = owner _object;
		if(_object call AH_AdminCheck) then {
			ADMIN_LOGS = LOG_LIST;
			_owner publicVariableClient "ADMIN_LOGS";
		};
	};
	LOG_LIST = [];
	[] spawn {
		_log_list_backUp = LOG_LIST;
		while{true} do {
			waitUntil{count(LOG_LIST) != count(_log_list_backUp)};
			if(count(LOG_LIST) > count(_log_list_backUp)) then {
				_log_list_backUp = LOG_LIST;
			} else {
				LOG_LIST = _log_list_backUp;
			};
		};
	};
	AH_Menu_DoTP = compileFinal ([AH_Menu_DoTP] call _toCompilableString);
	AH_TP_Here = compileFinal ([AH_TP_Here] call _toCompilableString);
	AH_TP_Me = compileFinal ([AH_TP_Me] call _toCompilableString);
	AH_Menu_TPAHere = compileFinal ([AH_Menu_TPAHere] call _toCompilableString);
	AH_Menu_Kick = compileFinal ([AH_Menu_Kick] call _toCompilableString);
	AH_Menu_Input = compileFinal ([AH_Menu_Input] call _toCompilableString);
	AH_Menu_DoSpawn = compileFinal ([AH_Menu_DoSpawn] call _toCompilableString);
	SERVER_LOG = compileFinal ([SERVER_LOG] call _toCompilableString);
	REQUEST_LOGS = compileFinal ([REQUEST_LOGS] call _toCompilableString);
};
if(isServer) then {
	if(player call AH_AdminCheck) then {
		AH_PM = false;
		AH_VM = false;
		AH_NT = false;
		AH_GM = false;
		[format["The admin '%1' has joined!",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
		AH_ViewLogs = {
			[player,"REQUEST_LOGS",false,false] call AH_fnc_MP;
			waitUntil{!isNil "ADMIN_LOGS"};
			_logs = ADMIN_LOGS;
			ADMIN_LOGS = nil;
			createDialog "RscDisplayChooseEditorLayout";
			disableSerialization;
			ctrlSetText[1000,"Admin Menu - View Server Logs"];
			_ctrl = (findDisplay 164) displayctrl 1;
			_ctrl ctrlSetText "Close";
			_ctrl ctrlCommit 0;
			_ctrl = (findDisplay 164) displayctrl 101;
			_c = 0;
			{
				_c = _c + 1;
				_ctrl lbAdd format["LOG #%1",_c];
				_ctrl lbSetData [(lbSize _ctrl)-1,_x];
			} forEach _logs;
			_ctrl ctrlAddEventHandler ["LbSelChanged",{
				_index = _this select 1;
				_message = ([lbData[101,_index],":"] call BIS_fnc_splitString) select 1;
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText format["<t size='0.7'>LOG: %1</t>",_message];
				_ctrl ctrlCommit 0;
			}];
			_ctrl ctrlCommit 0;
		};
		AH_SpawnMenu = {
			if(isNil "VEHICLE_LIST") then {
				VEHICLE_LIST = [];
				LAST_SEL_VEH = "";
				_AIR_LIST = [];
				_LAND_LIST = [];
				_WATER_LIST = [];
				_OBJECT_LIST = [];
				_cfg = configFile >> "cfgVehicles";
				for "_i" from 0 to count(_cfg)-1 do {
					_conf = _cfg select _i;
					if(isClass _conf) then {
						_type = configName _conf;
						if !(_type isKindOf "ParachuteBase") then {
							_picture = getText(configFile >> "cfgVehicles" >> _type >> "picture");
							_desc = getText(configFile >> "cfgVehicles" >> _type >> "library" >> "libTextDesc");
							if(_picture != "" && _desc != "" && (getNumber (configFile >> "cfgVehicles" >> _type >> "scope") == 2)) then {
								if(_type isKindOf "Air") then {
									_AIR_LIST = _AIR_LIST + [_type];
								};
								if(_type isKindOf "LandVehicle") then {
									_LAND_LIST = _LAND_LIST + [_type];
								};
								if(_type isKindOf "Ship") then {
									_WATER_LIST = _WATER_LIST + [_type];
								};
								if(_type isKindOf "Building") then {
									_OBJECT_LIST = _OBJECT_LIST + [_type];
								};
							};
						};
					};
				};
				VEHICLE_LIST = _AIR_LIST + _LAND_LIST + _WATER_LIST + _OBJECT_LIST;
			};

			createDialog "RscDisplayChooseEditorLayout";
			disableSerialization;
			ctrlSetText[1000,"Admin Menu - Spawn A Vehicle"];
			_ctrl = (findDisplay 164) displayctrl 1;
			_ctrl ctrlSetText "Spawn";
			_ctrl buttonSetAction '["Spawning vehicle"] call JSt4r_fnc_notification_system;_veh = LAST_SEL_VEH;_dir = getdir vehicle player;_pos = getPos vehicle player;_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];[[player,_veh,_pos,_dir],"AH_Menu_DoSpawn",false,false] call AH_fnc_MP;';
			_ctrl ctrlCommit 0;
			_ctrl = (findDisplay 164) displayctrl 101;
			{
				_name = getText(configFile >> "cfgVehicles" >> _x >> "displayName");
				_ctrl lbAdd _name;
				_ctrl lbSetData [(lbSize _ctrl)-1,_x];
				_ctrl lbSetPicture [(lbSize _ctrl)-1,getText(configFile >> "cfgVehicles" >> _x >> "Icon")];
			} forEach VEHICLE_LIST;
			_ctrl ctrlAddEventHandler ["LbSelChanged",{
				_index = _this select 1;
				_text = lbData[101,_index];
				LAST_SEL_VEH = _text;
				_picture = getText(configFile >> "cfgVehicles" >> _text >> "picture");
				_desc = getText(configFile >> "cfgVehicles" >> _text >> "library" >> "libTextDesc");
				_openLet = toArray(_desc) select 0;
				if(_openLet == (toArray("$") select 0)) then {
					_desc = localize _desc;
				};
				disableSerialization;
				_ctrl = (findDisplay 164) displayctrl 102;
				_ctrl ctrlSetText _picture;
				_ctrl ctrlCommit 0;
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText format["<t size='0.6'>%1</t>",_desc];
				_ctrl ctrlCommit 0;
			}];
			_ctrl ctrlCommit 0;
		};
		AH_AreYouSure = {
			_question = _this select 0;
			_responce = [_question, "Admin Menu", "Yes", "No"] call BIS_fnc_guiMessage;
			_responce
		};
		AH_Init = {
			if(player call AH_AdminCheck) then {
				if(isNull (FindDisplay 163)) then {
					disableserialization;
					createDialog "RscDisplayControlSchemes";

					_ctrl = (findDisplay 163) displayctrl 1000;
					_ctrl ctrlSetText "Admin Menu";
					_ctrl ctrlSetFont "PuristaSemiBold";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 163) displayctrl 1;
					_ctrl buttonSetAction "createDialog 'RscDisplayDebugPublic'";
					_ctrl ctrlSetFont "PuristaSemiBold";
					_ctrl ctrlSetText "Debug Menu";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 163) displayCtrl 2;
					_ctrl buttonSetAction "[] spawn AH_TP";
					_ctrl ctrlSetFont "PuristaSemiBold";
					_ctrl ctrlSetText "Teleport";
					_ctrl ctrlCommit 0;

					_ctrl = (findDisplay 163) displayctrl 101;
					_ctrl ctrlSetFont "PuristaSemiBold";
					_ctrl ctrlAddEventHandler ["LBDblClick",{(_this select 1) call AH_DBLClick}];
					_ctrl lbAdd "Kick A Player";
					_ctrl lbAdd "Spectate A Player";
					_ctrl lbAdd "Disable Input";
					_ctrl lbAdd "Enable Input";
					_ctrl lbAdd "Teleport Me";
					_ctrl lbAdd "Teleport Here";
					_ctrl lbAdd "God Mode";
					if(AH_GM) then {
						_ctrl lbSetColor [6,[0,1,0,1]];
					} else {
						_ctrl lbSetColor [6,[1,0,0,1]];
					};
					_ctrl lbAdd "Player Markers";
					if(AH_PM) then {
						_ctrl lbSetColor [7,[0,1,0,1]];
					} else {
						_ctrl lbSetColor [7,[1,0,0,1]];
					};
					_ctrl lbAdd "Vehicle Markers";
					if(AH_VM) then {
						_ctrl lbSetColor [8,[0,1,0,1]];
					} else {
						_ctrl lbSetColor [8,[1,0,0,1]];
					};
					_ctrl lbAdd "Show Name Tags";
					if(AH_NT) then {
						_ctrl lbSetColor [9,[0,1,0,1]];
					} else {
						_ctrl lbSetColor [9,[1,0,0,1]];
					};
					_ctrl lbAdd "Arsenal";
					_ctrl lbAdd "Heal Self";
				};
			};
		};
		AH_GetObject = {
			if !(player call AH_AdminCheck) exitWith {objnull};
			_name = _this;
			_obj = objnull;
			{
				if(name _x == _name) exitWith {
					_obj = _x;
				};
			} forEach allUnits;
			_obj;
		};
		AH_Spectate = {
			if !(player call AH_AdminCheck) exitWith {};
			_target = _this;
			_target switchCamera "INTERNAL";
			[format["The admin '%1' has started spectating '%2'!",name player,name _target],"SERVER_LOG",false,false] call AH_fnc_MP;
			["F10 to exit spectator mode"] call JSt4r_fnc_notification_system;
			AH_TEMPBIND = (findDisplay 46) displayAddEventHandler ["KeyDown","if((_this select 1) == 68) then {(findDisplay 46) displayRemoveEventHandler ['KeyDown',AH_TEMPBIND];player switchCamera 'INTERNAL';['You left the spectator mode'] call JSt4r_fnc_notification_system;};false"];
		};
		AH_Target = {
			if !(player call AH_AdminCheck) exitWith {};
			_script = _this;
			disableserialization;
			createDialog "RscDisplayChooseEditorLayout";
			ctrlSetText[1000,"Admin Menu - Select a target"];
			if(_script == 0) then {
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText "<t size='1.1'>Kick A Player</t><br/><t size='0.9'>Select a target to kick from the server!</t>";
				_ctrl ctrlCommit 0;

				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Kick";
				_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call AH_GetObject)],'AH_Menu_Kick',false,false] call AH_fnc_MP";
				_ctrl ctrlCommit 0;
			};
			if(_script == 1) then {
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText "<t size='1.1'>Spectate A Player</t><br/><t size='0.9'>Select a target to spectate them!</t>";
				_ctrl ctrlCommit 0;

				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Spectate";
				_ctrl buttonSetAction "(lbText[101,lbCurSel 101] call AH_GetObject) spawn AH_Spectate;";
				_ctrl ctrlCommit 0;
			};
			if(_script == 2) then {
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText "<t size='1.1'>Disable Input</t><br/><t size='0.9'>Select a target to disable their input!</t>";
				_ctrl ctrlCommit 0;

				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Disable Input";
				_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call AH_GetObject),false],'AH_Menu_Input',false,false] call AH_fnc_MP";
				_ctrl ctrlCommit 0;
			};
			if(_script == 3) then {
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText "<t size='1.1'>Enable Input</t><br/><t size='0.9'>Select a target to enable their input!</t>";
				_ctrl ctrlCommit 0;

				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Enable Input";
				_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call AH_GetObject),true],'AH_Menu_Input',false,false] call AH_fnc_MP";
				_ctrl ctrlCommit 0;
			};
			if(_script == 4) then {
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText "<t size='1.1'>Teleport Here</t><br/><t size='0.9'>Teleport the selected player to you!</t>";
				_ctrl ctrlCommit 0;

				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Teleport Here";
				_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call AH_GetObject)],'AH_TP_Here',false,false] call AH_fnc_MP";
				_ctrl ctrlCommit 0;
			};
			if(_script == 5) then {
				_ctrl = (findDisplay 164) displayctrl 1100;
				_ctrl ctrlSetStructuredText parseText "<t size='1.1'>Teleport Me</t><br/><t size='0.9'>Teleport to the selected player</t>";
				_ctrl ctrlCommit 0;

				_ctrl = (findDisplay 164) displayctrl 1;
				_ctrl ctrlSetText "Teleport Me";
				_ctrl buttonSetAction "[[player,(lbText[101,lbCurSel 101] call AH_GetObject)],'AH_TP_Me',false,false] call AH_fnc_MP";
				_ctrl ctrlCommit 0;
			};
			_ctrl = (findDisplay 164) displayctrl 101;
			{
				if(alive _x && isplayer _x) then {
					_ctrl lbadd (name _x);
				};
			} forEach allUnits;
			_ctrl ctrlCommit 0;
		};
		AH_DBLClick = {
			if !(player call AH_AdminCheck) exitWith {};
			_index = _this;
			switch(_index) do {
				case 0: {0 spawn AH_Target;};
				case 1: {1 spawn AH_Target;};
				case 2: {2 spawn AH_Target;};
				case 3: {3 spawn AH_Target;};
				case 4: {5 spawn AH_Target;};
				case 5: {4 spawn AH_Target;};
				case 6: {if(player call AH_AdminCheck) then {AH_GM = !AH_GM; if(AH_GM) then {lbSetColor[101,6,[0,1,0,1]];player allowDamage false;[] spawn AH_CarGod;format["%1 has turned on god mode",name player] call SERVER_LOG;["God Mode On"] call JSt4r_fnc_notification_system; } else {lbSetColor[101,6,[1,0,0,1]];player allowDamage true;[] spawn AH_CarGod; format["%1 has turned off godmode",name player] call SERVER_LOG;["God Mode Off"] call JSt4r_fnc_notification_system;};};};
				case 7: {[] spawn AH_MapMarkers;};
				case 8: {[] spawn AH_VehMarkers;};
				case 9: {call AH_ESP;};
				case 10: {closeDialog 500; ["Open",true] spawn BIS_fnc_arsenal; format["%1 has opened the arsenal",name player] call SERVER_LOG;}; 
				case 11: {closeDialog 500; player setDamage 0; ["You have healed yourself"] call JSt4r_fnc_notification_system; format["%1 has healed himself",name player] call SERVER_LOG;};
			};
		};
		AH_CarGod = {
			if !(player call AH_AdminCheck) exitWith {};
			if(AH_GM) then {
				while{AH_GM} do {
					_oldVeh = vehicle player;
					_oldVeh allowDamage false;
					_oldVeh setFuel 1;
					_oldVeh setDamage 0;
					waitUntil{_oldVeh != (vehicle player)};
					if(_oldVeh != player) then {
						_oldVeh allowDamage true;
						_oldVeh = vehicle player;
					};
				};
			} else {
				if(vehicle player != player) then {
					vehicle player allowDamage true;
				};
			};
		};
		AH_MapMarkers = {
			if !(player call AH_AdminCheck) exitWith {};
			AH_PM = !AH_PM;
			if(AH_PM) then {
				lbSetColor[101,7,[0,1,0,1]];
				AH_PrevMarkers = [];
				AH_DoneWhileLoop = false;
				["Player Markers On"] call JSt4r_fnc_notification_system;
				[format["The admin '%1' has enabled map markers",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
				while{AH_PM} do {
					{
						if !(_x in allUnits) then {
							deleteMarkerLocal str _x;
						};
					} forEach AH_PrevMarkers;
					AH_PrevMarkers = [];
					{
						if(alive _x && isplayer _x) then {
							deleteMarkerLocal str _x;
							_PlrMark = createMarkerLocal [str _x,getpos _x];
							_PlrMark setMarkerTypeLocal "waypoint";
							_PlrMark setMarkerPosLocal getPos _x;
							_PlrMark setMarkerSizeLocal [0.5,0.5];
							_PlrMark setMarkerTextLocal format['%1',name _x];
							_PlrMark setMarkerColorLocal ("ColorGreen");
							AH_PrevMarkers = AH_PrevMarkers + [_x];
						};
					} forEach allUnits;
					sleep 1;
				};
				AH_DoneWhileLoop = true;
			} else {
				[format["The admin '%1' has disabled map markers",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
				if(isNil "AH_DoneWhileLoop") exitWith {};
				lbSetColor[101,7,[1,0,0,1]];
				["Player Markers Off"] call JSt4r_fnc_notification_system;
				waitUntil{AH_DoneWhileLoop};
				{
					deleteMarkerLocal str _x;
				} forEach AH_PrevMarkers;	
			};
		};
		AH_VehMarkers = {
			if !(player call AH_AdminCheck) exitWith {};
			AH_VM = !AH_VM;
			if(AH_VM) then {
				lbSetColor[101,8,[0,1,0,1]];
				["Vehicle Markers On"] call JSt4r_fnc_notification_system;
				[format["The admin '%1' has enabled vehicle markers",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
				while{AH_VM} do {
					{
						if( (_x iskindof "Air" ) || (_x iskindof "Tank") || (_x isKindOf "Land") || (_x isKindOf "Ship"))  then {
							_VehMark = str _x;
							deleteMarkerLocal _VehMark;
							_VehMark = createMarkerLocal [_VehMark, getPos _x];
							_VehMark setMarkerTypeLocal "waypoint";
							_VehMark setMarkerPosLocal getPos _x;
							_VehMark setMarkerSizeLocal [0.5,0.5];
							_VehMark setMarkerTextLocal format['%1',typeOf _x];
							if ((_x isKindOf "Air") || (_x isKindOf "Tank")) then {
								_VehMark setMarkerColorLocal ("ColorRed");
							} else {
								if ((_x isKindOf "Land") || (_x isKindOf "Ship")) then {
									_VehMark setMarkerColorLocal ("ColorBlue");
								};
							};
						};	 
					} forEach vehicles;
					sleep 1;
				};
			} else {
				["Vehicle Markers Off"] call JSt4r_fnc_notification_system;
				[format["The admin '%1' has disabled vehicle markers",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
				lbSetColor[101,8,[1,0,0,1]];
				{
					if( (_x iskindof "Air" ) || (_x iskindof "Tank") || (_x isKindOf "Land") || (_x isKindOf "Ship"))  then {
						deleteMarkerLocal str _x;
					};
				} forEach vehicles;
			};
		};
		AH_ESP = {
			if !(player call AH_AdminCheck) exitWith {};
			AH_NT = !AH_NT;
			if(AH_NT) then {
				[format["The admin '%1' has enabled ESP",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
				lbSetColor[101,9,[0,1,0,1]];
				addMissionEventHandler["Draw3D", {
					{
						if((isPlayer _x) && ((side _x) == (side player)) && ((player distance _x) < 700) && (getplayeruid _x != "")) then {
							_pos = getposatl _x;
							_eyepos = ASLtoATL eyepos _x;
							if((getTerrainHeightASL [_pos select 0,_pos select 1]) < 0) then {
								_eyepos = eyepos _x;
								_pos = getposasl _x;
							};
							_1 = _x modelToWorld [-0.5,0,0];
							_2 = _x modelToWorld [0.5,0,0];
							_3 = _x modelToWorld [-0.5,0,0];
							_4 = _x modelToWorld [0.5,0,0];
							_1 set [2,_pos select 2];
							_2 set [2,_pos select 2];
							_3 set [2,(_eyepos select 2)+0.25];
							_4 set [2,(_eyepos select 2)+0.25];
							_HP = (damage _x - 1) * -100;
							_fontsize = 0.02;
							_eyepos set [2,(_3 select 2) - 0.1];
							drawIcon3D["",[0,1,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,'EtelkaNarrowMediumPro'];
							drawLine3D[_1,_2,[0,1,0,1]];
							drawLine3D[_2,_4,[0,1,0,1]];
							drawLine3D[_4,_3,[0,1,0,1]];
							drawLine3D[_3,_1,[0,1,0,1]];
						};
						if((isPlayer _x) && ((side _x) != (side player)) && ((player distance _x) < 1400) && (getplayeruid _x != "")) then {
							_pos = getposatl _x;
							_eyepos = ASLtoATL eyepos _x;
							_1 = _x modelToWorld [-0.5,0,0];
							_2 = _x modelToWorld [0.5,0,0];
							_3 = _x modelToWorld [-0.5,0,0];
							_4 = _x modelToWorld [0.5,0,0];
							_1 set [2,_pos select 2];
							_2 set [2,_pos select 2];
							_3 set [2,(_eyepos select 2)+0.25];
							_4 set [2,(_eyepos select 2)+0.25];
							_HP = (damage _x - 1) * -100;
							_fontsize = 0.02;
							_eyepos set [2,(_3 select 2) - 0.1];
							drawIcon3D["",[1,0,0,1],_eyepos,0.1,0.1,45,format["%1(%2m) - %3HP",name _x,round(player distance _x),round(_HP)],1,_fontsize,'EtelkaNarrowMediumPro'];
							drawLine3D[_1,_2,[1,0,0,1]];
							drawLine3D[_2,_4,[1,0,0,1]];
							drawLine3D[_4,_3,[1,0,0,1]];
							drawLine3D[_3,_1,[1,0,0,1]];
						};
					} forEach allUnits;
				}];
				["Name Tags On"] call JSt4r_fnc_notification_system;
			} else {
				[format["The admin '%1' has disabled ESP",name player],"SERVER_LOG",false,false] call AH_fnc_MP;
				["Name Tags Off"] call JSt4r_fnc_notification_system;
				removeAllMissionEventHandlers "Draw3D";
				lbSetColor[101,9,[1,0,0,1]];
			};
		};
		AH_TP = {
			if(player call AH_AdminCheck) then {
				if !("ItemMap" in items player) then {
					player addItem "ItemMap";	
				};
				openMap[true,false];
				onMapSingleClick '[[player,_pos],"AH_Menu_DoTP",false,fale] call AH_fnc_MP;openMap[false,false];onMapSingleClick "";false';
			};
		};
		AH_TP = compileFinal ([AH_TP] call _toCompilableString);
		AH_ESP = compileFinal ([AH_ESP] call _toCompilableString);
		AH_CarGod = compileFinal ([AH_CarGod] call _toCompilableString);
		AH_VehMarkers = compileFinal ([AH_VehMarkers] call _toCompilableString);
		AH_MapMarkers = compileFinal ([AH_MapMarkers] call _toCompilableString);
		AH_DBLClick = compileFinal ([AH_DBLClick] call _toCompilableString);
		AH_Target = compileFinal ([AH_Target] call _toCompilableString);
		AH_Spectate = compileFinal ([AH_Spectate] call _toCompilableString);
		AH_GetObject = compileFinal ([AH_GetObject] call _toCompilableString);
		AH_Init = compileFinal ([AH_Init] call _toCompilableString);
		AH_AreYouSure = compileFinal ([AH_AreYouSure] call _toCompilableString);
		AH_SpawnMenu = compileFinal ([AH_SpawnMenu] call _toCompilableString);
		AH_ViewLogs = compileFinal ([AH_ViewLogs] call _toCompilableString);
	};
};

