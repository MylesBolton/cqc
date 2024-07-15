/*
	File: jstar_playericons.sqf
	Author: JSt4r
*/

{
    private _unit = (vehicle _x);
    private _player = (vehicle player);
    private _distance = _player distance2D _unit;
	
	if ((group _x) == (group player) && {alive _x} && { _distance < 2500 }) then {
		private _text   = "";
		private _pos        = (_unit modelToWorldVisual (_unit selectionPosition "pelvis"));
		_pos set [2, (_pos select 2) + 0.2];
				  
		if(jstar_names) then { _text = format ['%1 | %2m', name _unit, round(player distance _x)]; };
							
		drawIcon3D [MISSION_ROOT + "images\jstar_group.paa",[1,1,1,1],_pos,1,1,0,_text,2,0.03,"RobotoCondensedLight"];
	};
} count allUnits - [player];