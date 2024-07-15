/*
	File: jstar_player.sqf
	Author: JSt4r
*/

/* fixing the aids part of arma */
disableSerialization;
enableEnvironment false;
player disableConversation true;
enableSentences false;
enableRadio false;
enableSaving [false, false];
0 setFog 0;
setTerrainGrid 48.99;
player setCustomAimCoef 0.1;
player setUnitTrait ["Medic",true];

/* no fatigue */
player enableFatigue false;
player addMPEventhandler ["MPRespawn", {player enableFatigue false}];

/* cleaning the chat */
0 enableChannel [true, false];
1 enableChannel [true, false];
2 enableChannel [true, false];
3 enableChannel [true, false];

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups; // Initializes the player/client side Dynamic Groups framework

/* scripts */
execVM "scripts\jstar_scripts\jstar_a.sqf";
execVM "scripts\jstar_scripts\jstar_keys.sqf";
execVM "scripts\jstar_scripts\jstar_jump.sqf";
execVM "scripts\jstar_scripts\jstar_icons.sqf";
execVM "scripts\jstar_scripts\jstar_handledamage.sqf";
execVM "scripts\jstar_scripts\jstar_escmenu.sqf";

/* player icons */
jstar_icons	= compileFinal preprocessFileLineNumbers "scripts\jstar_scripts\jstar_playericons.sqf";
if (!isDedicated) then {
["jstar_icons", "OnEachFrame", "jstar_icons"] call BIS_fnc_addStackedEventHandler;
};

/* group icons */
jstar_group_icons	= compileFinal preprocessFileLineNumbers "scripts\jstar_scripts\jstar_groupicons.sqf";
if (!isDedicated) then {
["jstar_group_icons", "OnEachFrame", "jstar_group_icons"] call BIS_fnc_addStackedEventHandler;
};

jstar_names = false;

/* health hud */
call compile preprocessFile "scripts\jstar_dialogs\jstar_healthhud.sqf";
[] spawn JSTAR_HUD;