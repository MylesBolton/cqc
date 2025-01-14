private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_respawnButton = (findDisplay 49) displayCtrl 103; // LHM
		_timeStamp = time + 3;
		
		waitUntil {
			_abortButton ctrlSetText format["Abort available in %1",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlSetTooltip "To Lobby";
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText "Abort";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
		
	};
};

_canUseControls = {
	if(side player == playerSide) exitWith {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_respawnButton = (findDisplay 49) displayCtrl 103;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false;
	_fieldManual ctrlShow false;
	_respawnButton ctrlSetText "By JSt4r";
	_abortButton ctrlSetEventHandler ["ButtonClick","[] spawn JSt4r_fnc_jstar_outro; (findDisplay 49) closeDisplay 2; true"];
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		_respawnButton ctrlEnable false; //Enable the button.
	};
	waitUntil{isNull (findDisplay 49)};
};