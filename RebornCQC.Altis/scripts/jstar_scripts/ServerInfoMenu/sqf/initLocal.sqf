/*
   Author: IT07

   Description:
   does whatever is needed to initialize the ServerInfoMenu
*/

if hasInterface then
   {
      if isMultiplayer then
        {
            waitUntil { if not ( isNull ( findDisplay 46 ) ) then { true } else { uiSleep 0.5; false } };
            if ( getText ( missionConfigFile >> "CfgServerInfoMenu" >> "openAtLogin" ) isEqualTo "yes" ) then { createDialog "RscDisplayServerInfoMenu" };
        };
   };
