/*
	File: jstar_og.sqf
	Author: JSt4r
*/

_jstar_og = ceil(random 15);
if (_jstar_og == 1) then {
	Aktjstar_og = getMarkerPos "jstar_og_1"; 
	jstar_ogCheck = getMarkerpos "jstar_og_1" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_1");
} else {
	_jstar_og = 2;
};};
if (_jstar_og == 2) then {	
	Aktjstar_og = getMarkerPos "jstar_og_2"; 
	jstar_ogCheck = getMarkerpos "jstar_og_2" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_2");
} else {
	_jstar_og = 3;
};};
if (_jstar_og == 3) then {	
	Aktjstar_og = getMarkerPos "jstar_og_3"; 
	jstar_ogCheck = getMarkerpos "jstar_og_3" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_3");
} else {
	_jstar_og = 4;
};};
if (_jstar_og == 4) then {	
	Aktjstar_og = getMarkerPos "jstar_og_4"; 
	jstar_ogCheck = getMarkerpos "jstar_og_4" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_4");
} else {
	_jstar_og = 5;
};};
if (_jstar_og == 5) then {	
	Aktjstar_og = getMarkerPos "jstar_og_5"; 
	jstar_ogCheck = getMarkerpos "jstar_og_5" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og;
		player setDir (markerDir "jstar_og_5");
} else {
	_jstar_og = 6;
};};
if (_jstar_og == 6) then {	
	Aktjstar_og = getMarkerPos "jstar_og_6"; 
	jstar_ogCheck = getMarkerpos "jstar_og_6" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_6");
} else {
	_jstar_og = 7;
};};
if (_jstar_og == 7) then {	
	Aktjstar_og = getMarkerPos "jstar_og_7"; 
	jstar_ogCheck = getMarkerpos "jstar_og_7" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then {
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_7");
} else {
	_jstar_og = 8;
};};
if (_jstar_og == 8) then {	
	Aktjstar_og = getMarkerPos "jstar_og_8"; 
	jstar_ogCheck = getMarkerpos "jstar_og_8" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_8");
} else {
	_jstar_og = 9;
};};
if (_jstar_og == 9) then {	
	Aktjstar_og = getMarkerPos "jstar_og_9"; 
	jstar_ogCheck = getMarkerpos "jstar_og_9" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_9");
} else {
	_jstar_og = 10;
};};
if (_jstar_og == 10) then {	
	Aktjstar_og = getMarkerPos "jstar_og_10"; 
	jstar_ogCheck = getMarkerpos "jstar_og_10" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_10");
} else {
	_jstar_og = 11;
};};

if (_jstar_og == 11) then {
	Aktjstar_og = getMarkerPos "jstar_og_11"; 
	jstar_ogCheck = getMarkerpos "jstar_og_11" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_11");
} else {
	_jstar_og = 12;
};};
if (_jstar_og == 12) then {	
	Aktjstar_og = getMarkerPos "jstar_og_12"; 
	jstar_ogCheck = getMarkerpos "jstar_og_12" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_12");
} else {
	_jstar_og = 13;
};};
if (_jstar_og == 13) then {	
	Aktjstar_og = getMarkerPos "jstar_og_13"; 
	jstar_ogCheck = getMarkerpos "jstar_og_13" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_13");
} else {
	_jstar_og = 14;
};};
if (_jstar_og == 14) then {	
	Aktjstar_og = getMarkerPos "jstar_og_14"; 
	jstar_ogCheck = getMarkerpos "jstar_og_14" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_14");
} else {
	_jstar_og = 15;
};};
if (_jstar_og == 15) then {	
	Aktjstar_og = getMarkerPos "jstar_og_15"; 
	jstar_ogCheck = getMarkerpos "jstar_og_15" nearEntities [["man"], 15];
	if (jstar_ogCheck isEqualTo []) then { 
		player setPos Aktjstar_og; 
		player setDir (markerDir "jstar_og_15");
} else {
	["All spawns blocked, try again"] call JSt4r_fnc_notification_system;
};};