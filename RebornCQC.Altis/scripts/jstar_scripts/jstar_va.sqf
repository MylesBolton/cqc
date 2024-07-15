/*
	File: jstar_va.sqf
	Author: JSt4r
*/

_crate = _this select 0;
["AmmoboxInit",[_crate,false,{true}]] spawn BIS_fnc_arsenal;

//Lists of items to include
_jstar_headgear = [
	"H_HelmetSpecB",
    "H_PilotHelmetFighter_B",
    "H_PilotHelmetFighter_I",
    "H_HelmetSpecB_blk",
    "H_PilotHelmetHeli_B",
    "H_CrewHelmetHeli_B",
    "H_HelmetLeaderO_ocamo",
    "H_HelmetB_camo",
    "H_Booniehat_khk",
    "H_Booniehat_indp",
    "H_Booniehat_oli",
    "H_Booniehat_indp",
    "H_Booniehat_khk_hs",
    "H_Cap_headphones",
    "H_Cap_blk",
    "H_Cap_blk_CMMG",
    "H_Cap_blk_Raven",
    "H_Cap_blk_ION",
    "H_PilotHelmetFighter_O",
    "H_Shemag_tan",
    "H_Beret_Colonel",
    "H_Beret_ocamo",
    "H_HelmetB_TI_tna_F",
    "H_Cap_blk_Syndikat_F",
    "H_Cap_tan_Syndikat_F",
    "H_Cap_oli_Syndikat_F",
    "H_Cap_grn_Syndikat_F",
    "H_ShemagOpen_khk",
    "H_ShemagOpen_tan",
    "H_Shemag_olive",
    "H_HelmetIA",
    "H_PilotHelmetFighter_B"

];

_jstar_glasses = [
	"G_Balaclava_blk",
	"G_Balaclava_combat",
	"G_Balaclava_lowprofile",
	"G_Balaclava_oli",
	"G_Balaclava_TI_blk_F",
	"G_Balaclava_TI_tna_F",
	"G_Balaclava_TI_G_blk_F",
	"G_Balaclava_TI_G_tna_F",
	"G_Bandanna_beast"
];

_jstar_clothing = [
	"U_B_Wetsuit",
	"U_O_Wetsuit",
	"U_B_PilotCoveralls",
	"U_I_CombatUniform",
	"U_I_CombatUniform_shortsleeve",
	"U_I_pilotCoveralls",
	"U_I_GhillieSuit",
	"U_B_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_B_FullGhillie_ard",
	"U_I_G_resistanceLeader_F",
	"U_I_GhillieSuit",
	"U_IG_Guerilla1_1",
	"U_IG_Guerilla2_1",
	"U_IG_Guerilla2_2",
	"U_IG_Guerilla3_1",
	"U_B_T_FullGhillie_tna_F",
	"U_B_T_Sniper_F",
	"U_I_Wetsuit",
	"U_NikosAgedBody",
	"U_C_Scientist",
	"U_BG_Guerrilla_6_1",
	"U_B_CTRG_Soldier_2_F",
	"U_B_CTRG_Soldier_F",
	"U_B_CTRG_Soldier_3_F",
	"U_B_CTRG_Soldier_2_F",
	"U_B_GEN_Soldier_F",
	"U_I_C_Soldier_Bandit_5_F",
	"U_I_C_Soldier_Bandit_2_F",
	"U_I_C_Soldier_Para_4_F",
	"U_Marshal",
	"U_B_CTRG_2"
];

_jstar_vests = [
	"V_PlateCarrier2_blk",
    "V_PlateCarrierIA2_dgtl",
    "V_PlateCarrierIAGL_dgtl",
    "V_PlateCarrier2_rgr_noflag_F",
    "V_PlateCarrier2_tna_F",
    "V_PlateCarrierIAGL_oli",
    "V_PlateCarrierH_CTRG"
];

_jstar_bags = [
	"B_AssaultPack_khk",
    "B_AssaultPack_dgtl",
    "B_AssaultPack_rgr",
    "B_AssaultPack_sgg",
    "B_AssaultPack_blk",
    "B_AssaultPack_cbr",
    "B_FieldPack_blk",
    "B_FieldPack_cbr",
    "B_OutdoorPack_blk",
    "B_FieldPack_ocamo",
	"B_TacticalPack_blk",
	"B_TacticalPack_mcamo",
	"B_Carryall_cbr",
	"B_Carryall_oli",
	"B_Carryall_khk",
	"B_Carryall_mcamo",
	"B_Carryall_oucamo",
	"B_Carryall_ocamo",
	"B_Kitbag_cbr",
	"B_Kitbag_mcamo",
	"B_AssaultPack_Kerry",
    "B_Kitbag_sgg"	
];

_jstar_guns = [
	"srifle_DMR_03_F",
    "srifle_DMR_03_multicam_F",
    "srifle_DMR_03_khaki_F",
    "srifle_DMR_03_tan_F",
    "srifle_DMR_03_woodland_F",
    "srifle_DMR_06_camo_F",
    "srifle_DMR_06_olive_F",
    "srifle_EBR_F",
    "arifle_ARX_blk_F",
    "arifle_ARX_ghex_F",
    "arifle_ARX_hex_F",
    "arifle_MXC_Black_F",
    "arifle_MX_Black_F",
    "arifle_MX_SW_Black_F",
    "arifle_MX_F",
    "arifle_MXC_F",
    "arifle_MX_SW_F",
    "arifle_MXM_F",
    "arifle_TRG21_F",
    "arifle_TRG20_F",
    "arifle_MX_khk_F",
    "arifle_MX_SW_khk_F",
    "arifle_MXC_khk_F",
    "arifle_MXM_khk_F",
    "arifle_MX_GL_khk_F",
    "arifle_MX_GL_F",
    "arifle_MX_GL_Black_F",
    "arifle_MXM_Black_F",
    "arifle_Katiba_F",
    "arifle_Mk20_F",
    "arifle_AKM_F",
    "arifle_CTAR_blk_F",
    "arifle_CTAR_hex_F",
    "arifle_CTAR_ghex_F",
	"arifle_AK12_F"
];
_jstar_attachments = [
	"acc_flashlight",
	"acc_pointer_IR",
	"optic_MRCO",
	"bipod_01_F_blk",
	"bipod_01_F_snd",
	"bipod_01_F_mtp",
	"muzzle_snds_H_khk_F",
	"muzzle_snds_H_snd_F",
	"optic_Arco_blk_F",
	"optic_Arco_ghex_F",
	"optic_ERCO_blk_F",
	"optic_Hamr_khk_F",
	"optic_ERCO_snd_F",
	"optic_ERCO_khk_F",
	"bipod_01_F_khk",
	"optic_Arco",
	"optic_Hamr",
	"muzzle_snds_H_SW",
	"muzzle_snds_H_MG",
	"muzzle_snds_H",
	"muzzle_snds_65_TI_blk_F",
	"muzzle_snds_65_TI_hex_F",
	"muzzle_snds_M",
	"muzzle_snds_58_wdm_F",
	"muzzle_snds_58_blk_F",
	"muzzle_snds_H_MG_blk_F",
	"muzzle_snds_H_MG_khk_F",
	"muzzle_snds_65_TI_ghex_F"
];

_jstar_acc = [
	"ItemWatch",
	"ItemCompass",
	"ItemGPS",
	"ItemRadio",
	"ItemMap",
	"Rangefinder",
	"NVGoggles",
	"NVGoggles_INDEP",
	"NVGoggles_OPFOR",
	"NVGoggles_tna_F",
	"O_NVGoggles_hex_F",
	"O_NVGoggles_urb_F",
	"O_NVGoggles_ghex_F",
	"NVGogglesB_blk_F",
	"NVGogglesB_grn_F",
	"NVGogglesB_gry_F",
	"FirstAidKit",
	"Medikit"
];
_jstar_mags = [
    "20Rnd_762x51_Mag",
    "30Rnd_65x39_caseless_green_mag_Tracer",
    "1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"3Rnd_Smoke_Grenade_shell",
	"3Rnd_SmokeRed_Grenade_shell",
	"3Rnd_SmokeGreen_Grenade_shell",
	"3Rnd_SmokeYellow_Grenade_shell",
	"3Rnd_SmokePurple_Grenade_shell",
	"3Rnd_SmokeBlue_Grenade_shell",
	"3Rnd_SmokeOrange_Grenade_shell",
    "30Rnd_65x39_caseless_mag",
    "30Rnd_580x42_Mag_F",
    "30Rnd_556x45_Stanag",
	"30Rnd_762x39_Mag_F"
];
//Populate with predefined items and whatever is already in the crate
[_crate,((backpackCargo _crate) + _jstar_bags)] call BIS_fnc_addVirtualBackpackCargo;
[_crate,((itemCargo _crate) + _jstar_headgear + _jstar_glasses + _jstar_clothing + _jstar_vests + _jstar_attachments + _jstar_acc)] call BIS_fnc_addVirtualItemCargo;
[_crate,(magazineCargo _crate + _jstar_mags)] call BIS_fnc_addVirtualMagazineCargo;
[_crate,((weaponCargo _crate) + _jstar_guns)] call BIS_fnc_addVirtualWeaponCargo;