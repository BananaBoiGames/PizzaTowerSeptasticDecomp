init_game();
global.combofreeze = 0;
global.coop = 0;
global.currentsavefile = 1;
global.mach_color1 = make_colour_rgb(96, 208, 72);
global.mach_color2 = make_colour_rgb(248, 0, 0);
global.afterimage_color1 = make_colour_rgb(255, 0, 0);
global.afterimage_color2 = make_colour_rgb(0, 255, 0);
global.smallnumber_color1 = make_colour_rgb(255, 255, 255);
global.smallnumber_color2 = make_colour_rgb(248, 0, 0);
global.optimize = 0;
global.autotile = 1;
global.font_small = __scribble_font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:?-=", 1, 0);
global.smallnumber_fnt = __scribble_font_add_sprite_ext(spr_smallnumber, "1234567890-", 1, 0);
global.pigreduction = 0;
global.pigtotal = 0;
global.levelcomplete = 0;
global.levelcompletename = -4;
global.entrancecutscene = -4;
global.medievalcutscene = -4;
global.ruincutscene = -4;
global.ruincutscene2 = -4;
global.ruincutscene3 = -4;
global.dungeoncutscene = -4;
global.peppermancutscene1 = -4;
global.peppermancutscene2 = -4;
global.chieftaincutscene = -4;
global.chieftaincutscene2 = -4;
global.desertcutscene = -4;
global.graveyardcutscene = -4;
global.spacecutscene = -4;
global.vigilantecutscene1 = -4;
global.vigilantecutscene2 = -4;
global.vigilantecutscene3 = -4;
global.farmcutscene = -4;
global.superpinballcutscene = -4;
global.pubcutscene = -4;
global.pinballcutscene = -4;
global.beercutscene = -4;
global.exitfeecutscene = -4;
global.forestcutscene = -4;
global.bottlecutscene = -4;
global.papercutscene = -4;
global.beachboatcutscene = -4;
global.beachcutscene = -4;
global.sewercutscene = -4;
global.burgercutscene = -4;
global.golfcutscene = -4;
global.anarchistcutscene1 = -4;
global.anarchistcutscene2 = -4;
global.factoryblock = -4;
global.streetcutscene = -4;
global.graffiticutscene = -4;
global.factorygraffiti = -4;
global.factorycutscene = -4;
global.hatcutscene1 = -4;
global.hatcutscene2 = -4;
global.hatcutscene3 = -4;
global.jetpackcutscene = -4;
global.noisecutscene1 = -4;
global.noisecutscene2 = -4;
global.freezercutscene = -4;
global.kidspartycutscene = -4;
global.gasolinecutscene = -4;
global.mansioncutscene = -4;
global.chateaucutscene = -4;
global.ghostsoldiercutscene = -4;
global.mrstickcutscene1 = -4;
global.mrstickcutscene2 = -4;
global.mrstickcutscene3 = -4;
global.chateauswap = -4;
global.warcutscene = -4;
ini_open("saveData.ini");
global.discordrpc = ini_read_real("Option", "DiscordRPC", true);
ini_close();
pal_swap_init_system(shd_pal_swapper);

with (obj_player1)
    state = UnknownEnum.Value_0;

global.loadeditor = 0;
room_goto(rm_mainmenu);
