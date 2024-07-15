/*
	File: jstar_playericons.sqf
	Author: JSt4r
*/

{
    private _unit = (vehicle _x);
    private _player = (vehicle player);
    private _distance = _player distance2D _unit;
	
	if(alive _unit && { _distance < 10 }) then {
		if (alive _x && vehicle _x == _x) then {
			_vis = lineIntersects [eyePos player, eyePos _x,player, _x];
			if(!_vis) then {
				private _text   = "";
				private _pos        = (_unit modelToWorldVisual (_unit selectionPosition "head"));
				_pos set [2, (_pos select 2) + 0.7];
							
				if ( _distance < 10 ) then { _text = (name _unit); };
				
				drawIcon3D ["iconMan",[1,1,1,1],_pos,0.65,0.65,0,_text,2,0.03,"PuristaMedium"];
			};
		};
	};
} count allPlayers - [(vehicle player)];