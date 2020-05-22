/*
*   Hier können eigene factions für grad-loadout eingetragen werden.
*   Anleitung im Wiki.
*/

class Separatists {
    class AllUnits {
        uniform = "";
        vest = "";
        backpack = "";
        headgear = "";
        primaryWeapon = "";
        primaryWeaponMagazine = "";
        primaryWeaponMuzzle = "";
        primaryWeaponOptics = "";
        primaryWeaponPointer = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        secondaryWeaponMuzzle = "";
        secondaryWeaponOptics = "";
        secondaryWeaponPointer = "";
        secondaryWeaponUnderbarrel = "";
        secondaryWeaponUnderbarrelMagazine = "";
        handgunWeapon = "";
        handgunWeaponMagazine = "";
        handgunWeaponMuzzle = "";
        handgunWeaponOptics = "";
        handgunWeaponPointer = "";
        handgunWeaponUnderbarrel = "";
        handgunWeaponUnderbarrelMagazine = "";
        goggles = "";
        nvgoggles = "";
        binoculars = "";
        map = "";
        gps = "";
        compass = "";
        watch = "";
        radio = "";
    };
    class Type {
        class soldier_F {
            uniform[] = {"gm_dk_army_uniform_soldier_84_m84", "gm_gc_civ_uniform_man_01_80_blk", "gm_dk_army_uniform_soldier_84_oli", "gm_gc_army_uniform_soldier_80_str", "gm_pl_army_uniform_soldier_autumn_80_moro", "gm_ge_bgs_uniform_soldier_80_smp"};
            vest[] = {"gm_pl_army_vest_80_rifleman_gry", "gm_pl_army_vest_80_mg_gry", "gm_pl_army_vest_80_at_gry", "gm_ge_army_vest_80_machinegunner", "gm_dk_army_vest_54_machinegunner", "gm_dk_army_vest_m00_m84", "gm_ge_army_vest_80_rifleman"};
            backpack = "";
            headgear[] = {"gm_gc_army_headgear_m56", "gm_pl_army_headgear_wz67_oli", "gm_ge_headgear_m62", "gm_dk_headgear_m52_oli", "gm_dk_headgear_m96_cover_m84", "gm_dk_headgear_m96_oli", "gm_gc_army_headgear_m56_cover_str", "gm_ge_headgear_winterhat_80_oli"};
            primaryWeapon[] = {"gm_c7a1_oli", "gm_c7a1_blk"};
            primaryWeaponMagazine = "gm_30Rnd_556x45mm_B_T_M856_stanag_gry";
            binoculars = "gm_ferod16_oli";
            map = "ItemMap";
            compass[] = {"gm_gc_compass_f73", "gm_ge_army_conat2"};
            watch[] = {"gm_watch_kosei_80", "ItemWatch"};
            gps = "";
            radio = "";
            nvgoggles = "";
            addItemsToUniform[] = {
                LIST_5("ACE_quikclot"),
                LIST_5("ACE_packingBandage"),
                LIST_5("ACE_elasticBandage"),
                LIST_2("ACE_tourniquet"),
                LIST_2("ACE_CableTie")
            };
            addItemsToVest[] = {
                LIST_6("gm_30Rnd_556x45mm_B_T_M856_stanag_gry"),
                LIST_2("gm_smokeshell_wht_dm25")
            };
        };
        class Soldier_AR_F: soldier_F {
            primaryWeapon = "gm_hmgpkm_prp";
            primaryWeaponMagazine = "gm_100Rnd_762x54mmR_B_T_7t2_pk_grn";
            addItemsToVest[] = {
                LIST_2("gm_smokeshell_wht_dm25"),
                LIST_4("gm_100Rnd_762x54mmR_B_T_7t2_pk_grn")
            };
        };
        class Soldier_TL_F: soldier_F {
            primaryWeapon = "gm_akm_wud";
            primaryWeaponMagazine = "gm_30Rnd_762x39mm_B_57N231_ak47_blk";
            addItemsToVest[] = {
                LIST_2("gm_smokeshell_wht_dm25"),
                LIST_2("gm_handgrenade_frag_rgd5"),
                LIST_6("gm_30Rnd_762x39mm_B_57N231_ak47_blk")
            };
        };
        class Soldier_GL_F: soldier_F {
            primaryWeapon = "gm_gvm75_grn";
            primaryWeaponMagazine = "gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk";
            handgunWeapon = "gm_lp1_blk";
            handgunWeaponMagazine = "gm_1Rnd_265mm_smoke_single_blk_gc";
            addItemsToVest[] = {
                LIST_2("gm_smokeshell_wht_dm25"),
                LIST_4("gm_1Rnd_265mm_smoke_single_blk_gc"),
                LIST_6("gm_20Rnd_762x51mm_B_T_DM21A1_g3_blk")
            };
        };
        class Soldier_LAT_F: soldier_F {
            secondaryWeapon[] = {"gm_rpg7_wud", "gm_rpg7_prp"};
            secondaryWeaponMagazine = "gm_1Rnd_40mm_heat_pg7v_rpg7";
			backpack[] = {"gm_pl_army_backpack_at_80_gry", "gm_gc_army_backpack_80_at_str"};
            addItemsToBackpack[] = {
                LIST_2("gm_1Rnd_40mm_heat_pg7v_rpg7")
            };
        };
        class medic_F: soldier_F {
            backpack[] = {"gm_pl_army_backpack_80_oli","gm_gc_army_backpack_80_assaultpack_str", "gm_ge_army_backpack_80_oli"};
            addItemsToBackpack[] = {
                LIST_15("ACE_packingBandage"),
                LIST_14("ACE_elasticBandage"),
                LIST_15("ACE_fieldDressing"),
                LIST_15("ACE_quikclot"),
                LIST_6("ACE_salineIV_500"),
                LIST_6("ACE_salineIV"),
                LIST_8("ACE_splint"),
                LIST_1("ACE_surgicalKit"),
                LIST_8("ACE_tourniquet")
            };
        };
		class Soldier_A_F: soldier_F{

		};
		class Soldier_AAR_F: soldier_F{

		};
		class support_AMG_F: soldier_F{

		};
		class support_AMort_F: soldier_F{

		};	
		class Soldier_AAA_F: soldier_F{

		};
		class Soldier_AAT_F: soldier_F{

		};
		class crew_F: soldier_F{

		};
		class engineer_F: soldier_F{

		};
		class Soldier_exp_F: soldier_F{

		};
		class support_GMG_F: soldier_F{

		};
		class support_MG_F: soldier_F{

		};	
		class support_Mort_F: soldier_F{

		};	
		class helicrew_F: soldier_F{

		};	
		class helipilot_F: soldier_F{

		};	
		class Soldier_M_F: soldier_F{

		};	
		class soldier_mine_F: soldier_F{

		};	
		class Soldier_AA_F: soldier_F{

		};	
		class Soldier_AT_F: soldier_F{

		};	
		class officer_F: soldier_F{

		};	
		class pilot_F: soldier_F{

		};	
		class Soldier_repair_F: soldier_F{

		};	
		class Soldier_LAT2_F: soldier_F{

		};	
		class Soldier_lite_F: soldier_F{

		};	
		class Soldier_unarmed_F: soldier_F{

		};
		class Soldier_SL_F: Soldier_TL_F{

		};
		class Survivor_F: soldier_F{

		};
		class soldier_UAV_F: soldier_F{

		};
		class soldier_UAV_06_F: soldier_F{

		};
		class soldier_UAV_06_medical_F: soldier_F{

		};																																																								
    };
};