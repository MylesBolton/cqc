/*
	File: jstar_lab.sqf
	Author: JSt4r
*/

_jstar_lab = ceil(random 15);
if (_jstar_lab == 1) then {
	Aktjstar_lab = getMarkerPos "jstar_lab_1"; 
	jstar_labCheck = getMarkerpos "jstar_lab_1" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_1");
} else {
	_jstar_lab = 2;
};};
if (_jstar_lab == 2) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_2"; 
	jstar_labCheck = getMarkerpos "jstar_lab_2" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_2");
} else {
	_jstar_lab = 3;
};};
if (_jstar_lab == 3) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_3"; 
	jstar_labCheck = getMarkerpos "jstar_lab_3" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_3");
} else {
	_jstar_lab = 4;
};};
if (_jstar_lab == 4) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_4"; 
	jstar_labCheck = getMarkerpos "jstar_lab_4" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_4");
} else {
	_jstar_lab = 5;
};};
if (_jstar_lab == 5) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_5"; 
	jstar_labCheck = getMarkerpos "jstar_lab_5" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab;
		player setDir (markerDir "jstar_lab_5");
} else {
	_jstar_lab = 6;
};};
if (_jstar_lab == 6) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_6"; 
	jstar_labCheck = getMarkerpos "jstar_lab_6" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_6");
} else {
	_jstar_lab = 7;
};};
if (_jstar_lab == 7) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_7"; 
	jstar_labCheck = getMarkerpos "jstar_lab_7" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then {
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_7");
} else {
	_jstar_lab = 8;
};};
if (_jstar_lab == 8) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_8"; 
	jstar_labCheck = getMarkerpos "jstar_lab_8" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_8");
} else {
	_jstar_lab = 9;
};};
if (_jstar_lab == 9) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_9"; 
	jstar_labCheck = getMarkerpos "jstar_lab_9" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_9");
} else {
	_jstar_lab = 10;
};};
if (_jstar_lab == 10) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_10"; 
	jstar_labCheck = getMarkerpos "jstar_lab_10" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_10");
} else {
	_jstar_lab = 11;
};};

if (_jstar_lab == 11) then {
	Aktjstar_lab = getMarkerPos "jstar_lab_11"; 
	jstar_labCheck = getMarkerpos "jstar_lab_11" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_11");
} else {
	_jstar_lab = 12;
};};
if (_jstar_lab == 12) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_12"; 
	jstar_labCheck = getMarkerpos "jstar_lab_12" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_12");
} else {
	_jstar_lab = 13;
};};
if (_jstar_lab == 13) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_13"; 
	jstar_labCheck = getMarkerpos "jstar_lab_13" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_13");
} else {
	_jstar_lab = 14;
};};
if (_jstar_lab == 14) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_14"; 
	jstar_labCheck = getMarkerpos "jstar_lab_14" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_14");
} else {
	_jstar_lab = 15;
};};
if (_jstar_lab == 15) then {	
	Aktjstar_lab = getMarkerPos "jstar_lab_15"; 
	jstar_labCheck = getMarkerpos "jstar_lab_15" nearEntities [["man"], 15];
	if (jstar_labCheck isEqualTo []) then { 
		player setPos Aktjstar_lab; 
		player setDir (markerDir "jstar_lab_15");
} else {
	["All spawns blocked, try again"] call JSt4r_fnc_notification_system;
};};