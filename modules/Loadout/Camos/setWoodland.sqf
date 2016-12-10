// by Quentin


possCamoUnif = ["U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CombatUniform_mcam_vest"];
if (uniform player in possCamoUnif) then
{
	private _vestItems = vestItems player;
	private _vestMagazines = vestMagazines player;
	switch (vest player) do
	{
		// if player wears Carrier GL Rig
		case "V_PlateCarrierGL_blk": {player addVest "V_PlateCarrierGL_rgr"};
		case "V_PlateCarrierGL_mtp": {player addVest "V_PlateCarrierGL_rgr"};
		case "V_PlateCarrierGL_tna_F": {player addVest "V_PlateCarrierGL_rgr"};
		// if player wears Carrier Lite
		case "V_PlateCarrier1_blk": {player addVest "V_PlateCarrier1_rgr"};
		case "V_PlateCarrier1_rgr_noflag_F": {player addVest "V_PlateCarrier1_rgr"};
		case "V_PlateCarrier1_tna_F": {player addVest "V_PlateCarrier1_rgr"};
		// if player wears Carrier Rig
		case "V_PlateCarrier2_blk": {player addVest "V_PlateCarrier2_rgr"};
		case "V_PlateCarrier2_rgr_noflag_F": {player addVest "V_PlateCarrier2_rgr"};
		case "V_PlateCarrier2_tna_F": {player addVest "V_PlateCarrier2_rgr"};
		// if player wears Carrier Special Rig
		case "V_PlateCarrierSpec_blk": {player addVest "V_PlateCarrierSpec_rgr"};
		case "V_PlateCarrierSpec_mtp": {player addVest "V_PlateCarrierSpec_rgr"};
		case "V_PlateCarrierSpec_tna_F": {player addVest "V_PlateCarrierSpec_rgr"};
		// if player wears Chest Rig
		case "V_Chestrig_blk": {player addVest "V_Chestrig_rgr"};
		case "V_Chestrig_khk": {player addVest "V_Chestrig_rgr"};
		case "V_Chestrig_oli": {player addVest "V_Chestrig_rgr"};
		// if player wears Slash Bandolier
		/*case "V_BandollierB_blk": {player addVest "V_BandollierB_rgr"};
		case "V_BandollierB_cbr": {player addVest "V_BandollierB_rgr"};
		case "V_BandollierB_ghex_F": {player addVest "V_BandollierB_rgr"};
		case "V_BandollierB_khk": {player addVest "V_BandollierB_rgr"};
		case "V_BandollierB_oli": {player addVest "V_BandollierB_rgr"};*/
		// ...this one is way cooler
		case "V_BandollierB_blk": {player addVest "V_TacVest_camo"};
		case "V_BandollierB_cbr": {player addVest "V_TacVest_camo"};
		case "V_BandollierB_ghex_F": {player addVest "V_TacVest_camo"};
		case "V_BandollierB_khk": {player addVest "V_TacVest_camo"};
		case "V_BandollierB_oli": {player addVest "V_TacVest_camo"};
		// more to come
		//case "": {player addVest "V_TacVest_camo"};
		
		default {nil};
	};
	{player addItemToVest _x; nil;} count _vestItems;
	{player addItemToVest _x; nil;} count _vestMagazines;
	if !(typeOf player in Officers) then
	{
		switch (headgear player) do
		{
			// if player wears simple Combat Helmet
			case "H_HelmetB": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_black": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_camo": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_desert": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_snakeskin": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_tna_F": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_sand": {player addHeadgear (["H_HelmetB_plain_mcamo","H_HelmetB_plain_blk","H_HelmetB"] call BIS_fnc_selectRandom)};
			// if player wears Enhanced Combat Helmet
			case "H_HelmetSpecB": {player addHeadgear (["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom)};
			case "H_HelmetSpecB_blk": {player addHeadgear (["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom)};
			case "H_HelmetSpecB_paint2": {player addHeadgear (["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom)};
			case "H_HelmetSpecB_sand": {player addHeadgear (["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom)};
			case "H_HelmetSpecB_snakeskin": {player addHeadgear (["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_Enh_tna_F": {player addHeadgear (["H_HelmetSpecB","H_HelmetSpecB_paint1","H_HelmetSpecB_blk","H_HelmetSpecB_snakeskin"] call BIS_fnc_selectRandom)};
			// if player wears Light Combat Helmet
			case "H_HelmetB_light": {player addHeadgear (["H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_light_black": {player addHeadgear (["H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_light_desert": {player addHeadgear (["H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_light_sand": {player addHeadgear (["H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_light_snakeskin": {player addHeadgear (["H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light"] call BIS_fnc_selectRandom)};
			case "H_HelmetB_Light_tna_F": {player addHeadgear (["H_HelmetB_light_grass","H_HelmetB_light_snakeskin","H_HelmetB_light_black","H_HelmetB_light"] call BIS_fnc_selectRandom)};
			// if player wears Military Cap
			case "H_MilCap_mcamo": {player addHeadgear "H_Cap_blk"};
			// if player wears Booniehat
			case "H_Booniehat_mcamo": {player addHeadgear "H_Booniehat_khk_hs"};
			
			default {nil};
		};
	};
	plyr_ldt = getUnitLoadout player;	// save default player loadout to apply on respawn later
	addMissionEventHandler ["EachFrame",	// add persistent MEH to maintain texture
	{
		if (uniform player in possCamoUnif && !("a3\characters_f\blufor\data\clothing_wdl_co.paa" in getObjectTextures player)) then
		{
			player setObjectTextureGlobal [0,"\a3\characters_f\BLUFOR\Data\clothing_wdl_co.paa"];
		};
	}];
};