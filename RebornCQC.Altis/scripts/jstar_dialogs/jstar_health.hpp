class JSTARBasePictureHUD
{
	access = 0;
	type = CT_STATIC;
	style = 0x30 + 0x800;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	font = "puristaMedium";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
  };

  class TAG_JSTARHUD
  {
	idd = -1; 
	duration = 1e+1000; 
	fadeIn = 0; 
	fadeOut = 0; 
	onLoad = "uiNamespace setVariable ['TAG_JSTAR_display', _this select 0];"; 
		   
	class Controls 
	{
		
		class HUD_HEALTH_PIC : JSTARBasePictureHUD
		{
			text = "images\jstar_health.paa";
			idc = -1;
			x = 0.95198 * safezoneW + safezoneX;
			y = 0.654 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.034 * safezoneH;
		};
		
		class HUD_HEALTH : IGUIBack
		{
			text = "";
			idc = 520502;
			sizeEx = "0.02 / (getResolution select 5)";
			x = 0.969319 * safezoneW + safezoneX;
			y = 0.659 * safezoneH + safezoneY;
			w = 0.0309375 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.7};
		};
		
		class jstar_credits
		{
			type = CT_STATIC;
			style = ST_CENTER;
			idc = 1003;
			text = "JSt4r_Sandbox";
			x = -0.00531252 * safezoneW + safezoneX;
			y = 0.978 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			sizeEx = 0.03;
		};
	};
}; 

class JSTARMUTED
{
    idd = 1000;
	movingEnable=0;
    duration=1e+011;
    onLoad = "uiNamespace setVariable ['JSTARMUTED', _this select 0];";
    class controls
	{
		class JSTAR_MUTED : JSTARBasePictureHUD
		{
			idc = 1101;
			text = "images\jstar_muted.paa";
			x = 0.95575 * safezoneW + safezoneX;
			y = 0.624 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.033 * safezoneH;
		};
	};
};

class JSTARGRASS
{
    idd = 1000;
	movingEnable=0;
    duration=1e+011;
    onLoad = "uiNamespace setVariable ['JSTARGRASS', _this select 0];";
    class controls
	{
		class JSTAR_GRASS : JSTARBasePictureHUD
		{
			idc = 1101;
			text = "images\jstar_nograss.paa";
			x = 0.979531 * safezoneW + safezoneX;
			y = 0.621 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.035 * safezoneH;
		};
	};
};