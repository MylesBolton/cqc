class LARs_overrideVATemplates
{
	tag = "LARs";
	class Inventory
	{
		file = "scripts\jstar_va\functions";
		class initOverride { postInit = 1; };
		class loadInventory_whiteList {};
		class overrideVAButtonDown {};
		class overrideVATemplateOK {};
		class applyLBColors {};
		class showRestrictedItems {};
		class addVAKeyEvents {};
	};
};