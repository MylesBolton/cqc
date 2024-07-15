class CfgServerInfoMenu
{
   addAction = 0; // Enable/disable action menu item | use 0 to disable | default: 1 (enabled)
   antiHACK = "";
   CreatedBy = "JSt4r, Roxz";
   ipPort = "Created By JSt4r, Roxz";
   openKey = ""; // https://community.bistudio.com/wiki/inputAction/actions
   openAtLogin = yes;
   restart = 0; // Amount of hours before server automatically restarts
   serverName = "RebornCQC";
   class menuItems
   {
      // title AND content accept formatted text ( since update Oct5.2016 )
      class first
      {
         menuName = "General";
         title = "<t color='#ffffff'>GENERAL INFORMATION</t>";
         content[] = {
			"<t size='1.75'>Controls</t><br /><br />",
			"<t size='1.25'>Shift 1</t><br />Main Menu<br />",
			"<t size='1.25'>Shift 2</t><br />Vehicle Spawner<br />",
			"<t size='1.25'>Windows Key (On Vehicle)</t><br />Vehicle Interaction Menu<br />",
			"<t size='1.25'>Shift V</t><br />Jump<br />",
			"<t size='1.25'>Tilde Key</t><br />Toggle Names On Hex's<br />"
         };
      };
      class second
      {
         menuName = "Rules";
         title = "SERVER RULES";
         content[] = {
            "<t size='1.75'>Rule #1</t><br />No hacking/exploiting<br />",
            "<t size='1.75'>Rule #2</t><br />No VDM<br />"
         };
      };
      class fourth
      {
         menuName = "Admins";
         title = "ADMINISTRATORS";
         content[] = {"JSt4r, Roxz"};
      };
      class seventh
      {
         menuName = "Credits";
         title = "CREDITS";
         content[] = {
            "<t size='1.25'>Roxz:</t> Edited it for Reborn RP purposes!",
            "<br />",
            "<t size='1.25'>DnA:</t> Vehicle menu creation!",
            "<br />",
            "<t size='1.25'>JSt4r:</t> Original creator!"
         };
      };
   };
};
