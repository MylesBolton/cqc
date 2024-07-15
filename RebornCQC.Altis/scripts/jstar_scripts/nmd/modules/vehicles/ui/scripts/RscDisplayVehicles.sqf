banlist = ["playerid"];
_reason = systemChat "reason"; //give reason

if(getplayerUID player in banlist) then {

	disableUserInput true;
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	systemchat format ["You are banned from this server [%1]", _reason];
	sleep 5;
	failMission "LOSER";
};