
			player addEventHandler ["HandleDamage",{

			private["_unit","_part","_damage","_source"];

			_unit = _this select 0;
			_part = _this select 1;
			_damage = _this select 2;
			_source = _this select 3;

			private["_vehicle"];
			_vehicle = vehicle _source;
			if((vehicle _source isKindOf "LandVehicle") && ((driver _vehicle) == _source)) then {
				 if(_source != _unit AND {alive _unit} AND {isPlayer _source}) then {
				 _damage = 0.001;
				 ["You have been VDM'd"] call JSt4r_fnc_notification_system;
				};
			};
			_damage;
		}];
		
		player addEventHandler [ "Killed", {
			params[ "_killed", "_killer" ];
			
			if ( !( _killer isEqualTo _killed ) && { isPlayer _killer && { side _killer isEqualTo side group _killed }} ) then {
				[ _killer, [ 2, 0, 0, 0, 0 ] ] remoteExec[ "addPlayerScores", 2 ];
			};
		}];
		
			
		player addEventHandler ["Respawn",{
		waitUntil {!isNull player};
		createDialog "jstar_respawn";
		}];
		
		player addEventHandler ["InventoryOpened", {
		  [_this select 0, _this select 1] spawn {   
			waituntil {!(isnull (finddisplay 602)) && ((_this select 1) == backpackContainer cursorTarget or (!alive cursorTarget && cursorTarget isKindOf "man")) };
			["You cannot look in players inventory's"] call JSt4r_fnc_notification_system;
			closeDialog 602
		   };
		  false
		}];
		
		0 = player addEventHandler ["HandleHeal", {
			_this spawn {
				params ["_injured","_healer"];
				_damage = damage _injured;
				if (_injured == _healer) then {
					waitUntil {damage _injured != _damage};
					if (damage _injured < _damage) then {
						_injured setDamage 0;
					};
				};
			};
		}];