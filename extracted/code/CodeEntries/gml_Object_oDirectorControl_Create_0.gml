average_item_value = 0;
epic_teleporter = 0;
keycard_dropped = 0;
spawn_boss = 0;
drone_count = 0;
multikill = 0;
stages_passed = 0;
teleporter_x = 0;
teleporter_y = 0;
pos_points = 0;
init = 0;
global.director = id;
boss_drop = 0;
bonus_rate = 1;
stages_passed = 0;
alarm[0] = 60;
alarm[1] = 600 / bonus_rate;
points = 0;
time_start = 0;
global.director = id;
card_choice = 0;
initial_spawn = 0;
fake_teleporter_index = 4;
boss_number = -1;
chest_number = -1;
monster_number = -1;
count = 0;
target_poi = -1;
ghost_count = 0;
deactivated_count = 0;
deactivated_x = 0;
deactivated_y = 0;
card_choice = 0;
for (i = 0; i <= 20; i += 1)
{
    spawn[i, 0] = -1;
    pos_spawn[i, 0] = -1;
    pos_spawn[i, 1] = 1;
}
tier1_count = 24;
tier2_count = 26;
tier3_count = 25;
use_count = 25;
tier1_list = ds_list_create();
tier2_list = ds_list_create();
tier3_list = ds_list_create();
use_list = ds_list_create();
for (i = 0; i <= tier1_count; i += 1)
{
    item_tier1[i, 1] = 1;
}
item_tier1[0, 0] = 338;
item_tier1[1, 0] = 350;
item_tier1[2, 0] = 351;
item_tier1[3, 0] = 353;
item_tier1[4, 0] = 355;
item_tier1[5, 0] = 354;
item_tier1[6, 0] = 352;
item_tier1[7, 0] = 349;
item_tier1[8, 0] = 356;
item_tier1[9, 0] = 357;
item_tier1[10, 0] = 358;
item_tier1[11, 0] = 359;
item_tier1[12, 0] = 348;
item_tier1[13, 0] = 347;
item_tier1[14, 0] = 346;
item_tier1[15, 0] = 345;
item_tier1[16, 0] = 360;
item_tier1[17, 0] = 343;
item_tier1[18, 0] = 344;
item_tier1[19, 0] = 342;
item_tier1[20, 0] = 341;
item_tier1[21, 0] = 336;
item_tier1[22, 0] = 337;
item_tier1[23, 0] = 340;
item_tier1[24, 0] = 339;
if (oInit.achievement[2, 0] == 2)
{
    item_tier1[3, 1] = 1;
}
else
{
    item_tier1[3, 1] = 0;
}
if (oInit.achievement[5, 0] == 2)
{
    item_tier1[4, 1] = 1;
}
else
{
    item_tier1[4, 1] = 0;
}
if (oInit.achievement[0, 0] == 2)
{
    item_tier1[11, 1] = 1;
}
else
{
    item_tier1[11, 1] = 0;
}
if (oInit.achievement[45, 0] == 2)
{
    item_tier1[17, 1] = 1;
}
else
{
    item_tier1[17, 1] = 0;
}
if (oInit.achievement[15, 0] == 2)
{
    item_tier1[15, 1] = 1;
}
else
{
    item_tier1[15, 1] = 0;
}
if (oInit.achievement[38, 0] == 2)
{
    item_tier1[12, 1] = 1;
}
else
{
    item_tier1[12, 1] = 0;
}
if (oInit.achievement[21, 0] == 2)
{
    item_tier1[21, 1] = 1;
}
else
{
    item_tier1[21, 1] = 0;
}
if (oInit.achievement[24, 0] == 2)
{
    item_tier1[22, 1] = 1;
}
else
{
    item_tier1[22, 1] = 0;
}
if (oInit.achievement[53, 0] == 2)
{
    item_tier1[24, 1] = 1;
}
else
{
    item_tier1[24, 1] = 0;
}
for (i = 0; i <= tier1_count; i += 1)
{
    if (item_tier1[i, 1] == 1)
    {
        ds_list_add(tier1_list, item_tier1[i, 0]);
    }
}
for (i = 0; i <= tier2_count; i += 1)
{
    item_tier2[i, 1] = 1;
}
item_tier2[0, 0] = 384;
item_tier2[1, 0] = 376;
item_tier2[2, 0] = 366;
item_tier2[3, 0] = 377;
item_tier2[4, 0] = 361;
item_tier2[5, 0] = 378;
item_tier2[6, 0] = 379;
item_tier2[7, 0] = 380;
item_tier2[8, 0] = 381;
item_tier2[9, 0] = 375;
item_tier2[10, 0] = 383;
item_tier2[11, 0] = 385;
item_tier2[12, 0] = 386;
item_tier2[13, 0] = 387;
item_tier2[14, 0] = 374;
item_tier2[15, 0] = 373;
item_tier2[16, 0] = 372;
item_tier2[17, 0] = 382;
item_tier2[18, 0] = 370;
item_tier2[19, 0] = 362;
item_tier2[20, 0] = 371;
item_tier2[21, 0] = 365;
item_tier2[22, 0] = 364;
item_tier2[23, 0] = 363;
item_tier2[24, 0] = 369;
item_tier2[25, 0] = 368;
item_tier2[26, 0] = 367;
if (oInit.achievement[42, 0] == 2)
{
    item_tier2[4, 1] = 1;
}
else
{
    item_tier2[4, 1] = 0;
}
if (oInit.achievement[25, 0] == 2)
{
    item_tier2[6, 1] = 1;
}
else
{
    item_tier2[6, 1] = 0;
}
if (oInit.achievement[33, 0] == 2)
{
    item_tier2[7, 1] = 1;
}
else
{
    item_tier2[7, 1] = 0;
}
if (oInit.achievement[27, 0] == 2)
{
    item_tier2[8, 1] = 1;
}
else
{
    item_tier2[8, 1] = 0;
}
if (oInit.achievement[44, 0] == 2)
{
    item_tier2[13, 1] = 1;
}
else
{
    item_tier2[13, 1] = 0;
}
if (oInit.achievement[18, 0] == 2)
{
    item_tier2[18, 1] = 1;
}
else
{
    item_tier2[18, 1] = 0;
}
if (oInit.achievement[7, 0] == 2)
{
    item_tier2[15, 1] = 1;
}
else
{
    item_tier2[15, 1] = 0;
}
if (oInit.achievement[36, 0] == 2)
{
    item_tier2[17, 1] = 1;
}
else
{
    item_tier2[17, 1] = 0;
}
if (oInit.achievement[41, 0] == 2)
{
    item_tier2[23, 1] = 1;
}
else
{
    item_tier2[23, 1] = 0;
}
if (oInit.achievement[22, 0] == 2)
{
    item_tier2[22, 1] = 1;
}
else
{
    item_tier2[22, 1] = 0;
}
if (oInit.achievement[48, 0] == 2)
{
    item_tier2[21, 1] = 1;
}
else
{
    item_tier2[21, 1] = 0;
}
for (i = 0; i <= tier2_count; i += 1)
{
    if (item_tier2[i, 1] == 1)
    {
        ds_list_add(tier2_list, item_tier2[i, 0]);
    }
}
for (i = 0; i <= tier3_count; i += 1)
{
    item_tier3[i, 1] = 1;
}
item_tier3[0, 0] = 392;
item_tier3[1, 0] = 401;
item_tier3[2, 0] = 403;
item_tier3[3, 0] = 402;
item_tier3[4, 0] = 404;
item_tier3[5, 0] = 390;
item_tier3[6, 0] = 395;
item_tier3[7, 0] = 405;
item_tier3[8, 0] = 389;
item_tier3[9, 0] = 406;
item_tier3[10, 0] = 408;
item_tier3[11, 0] = 409;
item_tier3[12, 0] = 410;
item_tier3[13, 0] = 398;
item_tier3[14, 0] = 400;
item_tier3[15, 0] = 399;
item_tier3[16, 0] = 407;
item_tier3[17, 0] = 412;
item_tier3[18, 0] = 394;
item_tier3[19, 0] = 411;
item_tier3[20, 0] = 413;
item_tier3[21, 0] = 393;
item_tier3[22, 0] = 391;
item_tier3[23, 0] = 388;
item_tier3[24, 0] = 397;
item_tier3[25, 0] = 396;
if (oInit.achievement[37, 0] == 2)
{
    item_tier3[7, 1] = 1;
}
else
{
    item_tier3[7, 1] = 0;
}
if (oInit.achievement[11, 0] == 2)
{
    item_tier3[0, 1] = 1;
}
else
{
    item_tier3[0, 1] = 0;
}
if (oInit.achievement[43, 0] == 2)
{
    item_tier3[3, 1] = 1;
}
else
{
    item_tier3[3, 1] = 0;
}
if (oInit.achievement[12, 0] == 2)
{
    item_tier3[18, 1] = 1;
}
else
{
    item_tier3[18, 1] = 0;
}
if (oInit.achievement[31, 0] == 2)
{
    item_tier3[15, 1] = 1;
}
else
{
    item_tier3[15, 1] = 0;
}
if (oInit.achievement[8, 0] == 2)
{
    item_tier3[14, 1] = 1;
}
else
{
    item_tier3[14, 1] = 0;
}
if (oInit.achievement[10, 0] == 2)
{
    item_tier3[10, 1] = 1;
}
else
{
    item_tier3[10, 1] = 0;
}
if (oInit.achievement[35, 0] == 2)
{
    item_tier3[20, 1] = 1;
}
else
{
    item_tier3[20, 1] = 0;
}
if (oInit.achievement[13, 0] == 2)
{
    item_tier3[23, 1] = 1;
}
else
{
    item_tier3[23, 1] = 0;
}
if (oInit.achievement[28, 0] == 2)
{
    item_tier3[21, 1] = 1;
}
else
{
    item_tier3[21, 1] = 0;
}
if (oInit.achievement[46, 0] == 2)
{
    item_tier3[22, 1] = 1;
}
else
{
    item_tier3[22, 1] = 0;
}
if (oInit.achievement[50, 0] == 2)
{
    item_tier3[24, 1] = 1;
}
else
{
    item_tier3[24, 1] = 0;
}
if (oInit.achievement[51, 0] == 2)
{
    item_tier3[25, 1] = 1;
}
else
{
    item_tier3[25, 1] = 0;
}
for (i = 0; i <= tier3_count; i += 1)
{
    if (item_tier3[i, 1] == 1)
    {
        ds_list_add(tier3_list, item_tier3[i, 0]);
    }
}
for (i = 0; i <= use_count; i += 1)
{
    item_use[i, 1] = 1;
}
item_use[0, 0] = 426;
item_use[1, 0] = 419;
item_use[2, 0] = 427;
item_use[3, 0] = 428;
item_use[4, 0] = 429;
item_use[5, 0] = 430;
item_use[6, 0] = 431;
item_use[7, 0] = 432;
item_use[8, 0] = 433;
item_use[9, 0] = 434;
item_use[10, 0] = 435;
item_use[11, 0] = 436;
item_use[12, 0] = 437;
item_use[13, 0] = 438;
item_use[14, 0] = 439;
item_use[15, 0] = 440;
item_use[16, 0] = 424;
item_use[17, 0] = 441;
item_use[18, 0] = 425;
item_use[19, 0] = 423;
item_use[20, 0] = 414;
item_use[21, 0] = 417;
item_use[22, 0] = 415;
item_use[23, 0] = 422;
item_use[24, 0] = 421;
item_use[25, 0] = 420;
if (oInit.achievement[3, 0] == 2)
{
    item_use[2, 1] = 1;
}
else
{
    item_use[2, 1] = 0;
}
if (oInit.achievement[9, 0] == 2)
{
    item_use[3, 1] = 1;
}
else
{
    item_use[3, 1] = 0;
}
if (oInit.achievement[34, 0] == 2)
{
    item_use[6, 1] = 1;
}
else
{
    item_use[6, 1] = 0;
}
if (oInit.achievement[16, 0] == 2)
{
    item_use[7, 1] = 1;
}
else
{
    item_use[7, 1] = 0;
}
if (oInit.achievement[19, 0] == 2)
{
    item_use[8, 1] = 1;
}
else
{
    item_use[8, 1] = 0;
}
if (oInit.achievement[1, 0] == 2)
{
    item_use[10, 1] = 1;
}
else
{
    item_use[10, 1] = 0;
}
if (oInit.achievement[4, 0] == 2)
{
    item_use[13, 1] = 1;
}
else
{
    item_use[13, 1] = 0;
}
if (oInit.achievement[39, 0] == 2)
{
    item_use[15, 1] = 1;
}
else
{
    item_use[15, 1] = 0;
}
if (oInit.achievement[30, 0] == 2)
{
    item_use[20, 1] = 1;
}
else
{
    item_use[20, 1] = 0;
}
if (oInit.achievement[40, 0] == 2)
{
    item_use[22, 1] = 1;
}
else
{
    item_use[22, 1] = 0;
}
if (oInit.achievement[54, 0] == 2)
{
    item_use[23, 1] = 1;
}
else
{
    item_use[23, 1] = 0;
}
for (i = 0; i <= use_count; i += 1)
{
    if (item_use[i, 1] == 1)
    {
        ds_list_add(use_list, item_use[i, 0]);
    }
}
if (oInit.coop == 2)
{
    item_use[15, 1] = 0;
    item_tier3[5, 1] = 0;
    item_tier2[4, 1] = 0;
    item_use[18, 1] = 0;
    item_use[0, 1] = 0;
}
card[0, 0] = "Lizard";
card[0, 1] = 0;
card[0, 2] = 8;
card[0, 3] = 439;
card[0, 4] = 220;
card[0, 5] = 118;
card[0, 6] = 441;
card[27, 0] = "Lizard G";
card[27, 1] = 0;
card[27, 2] = 180;
card[27, 3] = 461;
card[27, 4] = 224;
card[27, 5] = 115;
card[27, 6] = 458;
card[19, 0] = "Child";
card[19, 1] = 0;
card[19, 2] = 8;
card[19, 3] = 661;
card[19, 4] = 226;
card[19, 5] = -1;
card[19, 6] = 652;
card[1, 0] = "Golem";
card[1, 1] = 0;
card[1, 2] = 29;
card[1, 3] = 472;
card[1, 4] = 231;
card[1, 5] = 86;
card[1, 6] = 471;
card[13, 0] = "Golem Snow";
card[13, 1] = 0;
card[13, 2] = 35;
card[13, 3] = 486;
card[13, 4] = 232;
card[13, 5] = 86;
card[13, 6] = 485;
card[20, 0] = "Child G";
card[20, 1] = 0;
card[20, 2] = 45;
card[20, 3] = 656;
card[20, 4] = 227;
card[20, 5] = -1;
card[20, 6] = 652;
card[2, 0] = "Jelly";
card[2, 1] = 3;
card[2, 2] = 37;
card[2, 3] = 245;
card[3, 0] = "Wisp";
card[3, 1] = 0;
card[3, 2] = 40;
card[3, 3] = 527;
card[3, 4] = 252;
card[3, 5] = 167;
card[3, 6] = 525;
card[32, 0] = "Naut";
card[32, 1] = 0;
card[32, 2] = 100;
card[32, 3] = 705;
card[32, 4] = 253;
card[32, 5] = 167;
card[32, 6] = 708;
card[4, 0] = "Wisp G";
card[4, 1] = 0;
card[4, 2] = 160;
card[4, 3] = 532;
card[4, 4] = 254;
card[4, 5] = 167;
card[4, 6] = 531;
card[30, 0] = "Wisp G2";
card[30, 1] = 0;
card[30, 2] = 420;
card[30, 3] = 536;
card[30, 4] = 255;
card[30, 5] = 167;
card[30, 6] = 544;
card[5, 0] = "GolemG";
card[5, 1] = 1;
card[5, 2] = 760;
card[5, 3] = 230;
card[5, 4] = 86;
card[11, 0] = "WispB";
card[11, 1] = 1;
card[11, 2] = 860;
card[11, 3] = 257;
card[11, 4] = 167;
card[11, 6] = 544;
card[7, 0] = "Worm";
card[7, 1] = 2;
card[7, 2] = 760;
card[7, 3] = 237;
card[6, 0] = "Giant Jelly";
card[6, 1] = 3;
card[6, 2] = 760;
card[6, 3] = 249;
card[31, 0] = "Giant Jelly2";
card[31, 1] = 3;
card[31, 2] = 460;
card[31, 3] = 250;
card[8, 0] = "Crab";
card[8, 1] = 0;
card[8, 2] = 33;
card[8, 3] = 612;
card[8, 4] = 277;
card[8, 5] = 62;
card[8, 6] = 609;
card[9, 0] = "Imp";
card[9, 1] = 0;
card[9, 2] = 100;
card[9, 3] = 561;
card[9, 4] = 258;
card[9, 5] = 98;
card[9, 6] = 562;
card[10, 0] = "Mush";
card[10, 1] = 0;
card[10, 2] = 50;
card[10, 3] = 600;
card[10, 4] = 275;
card[10, 5] = 130;
card[10, 6] = 604;
card[12, 0] = "Bison";
card[12, 1] = 0;
card[12, 2] = 140;
card[12, 3] = 556;
card[12, 4] = 267;
card[12, 5] = 25;
card[12, 6] = 551;
card[14, 0] = "Clay";
card[14, 1] = 0;
card[14, 2] = 20;
card[14, 3] = 584;
card[14, 4] = 266;
card[14, 5] = 53;
card[14, 6] = 590;
card[15, 0] = "Spider";
card[15, 1] = 0;
card[15, 2] = 42;
card[15, 3] = 620;
card[15, 4] = 280;
card[15, 5] = 151;
card[15, 6] = 623;
card[16, 0] = "Ev. Lem";
card[16, 1] = 3;
card[16, 2] = 40;
card[16, 3] = 228;
card[18, 0] = "Turtle";
card[18, 1] = 3;
card[18, 2] = 1220;
card[18, 3] = 283;
card[33, 0] = "Ifrit";
card[33, 1] = 1;
card[33, 2] = 1240;
card[33, 3] = 320;
card[33, 4] = 170;
card[17, 0] = "Boar";
card[17, 1] = 1;
card[17, 2] = 1220;
card[17, 3] = 286;
card[17, 4] = 31;
card[23, 0] = "Scavenger";
card[23, 1] = 0;
card[23, 2] = 1320;
card[23, 3] = 687;
card[23, 4] = 290;
card[23, 5] = 144;
card[23, 6] = 685;
card[25, 0] = "Imp Overlord";
card[25, 1] = 0;
card[25, 2] = 1200;
card[25, 3] = 571;
card[25, 4] = 261;
card[25, 5] = 98;
card[25, 6] = 562;
card[24, 0] = "Guard";
card[24, 1] = 0;
card[24, 2] = 250;
card[24, 3] = 677;
card[24, 4] = 293;
card[24, 5] = 89;
card[24, 6] = 667;
card[26, 0] = "Imp Overlord";
card[26, 1] = 1;
card[26, 2] = 330;
card[26, 3] = 263;
card[26, 4] = 98;
card[22, 0] = "Bug";
card[22, 1] = 3;
card[22, 2] = 55;
card[22, 3] = 297;
card[28, 0] = "Spitter";
card[28, 1] = 0;
card[28, 2] = 103;
card[28, 3] = 503;
card[28, 4] = 233;
card[28, 5] = 62;
card[28, 6] = 609;
card[29, 0] = "Gup";
card[29, 1] = 0;
card[29, 2] = 250;
card[29, 3] = 696;
card[29, 4] = 299;
card[29, 5] = 130;
card[29, 6] = 604;
pos_card[1, 0] = "Chest 1";
pos_card[1, 1] = 0;
pos_card[1, 2] = 50;
pos_card[1, 3] = 80;
pos_card[2, 0] = "Chest 2";
pos_card[2, 1] = 0;
pos_card[2, 2] = 110;
pos_card[2, 3] = 82;
pos_card[7, 0] = "Chest 3";
pos_card[7, 1] = 0;
pos_card[7, 2] = 75;
pos_card[7, 3] = 85;
pos_card[14, 0] = "Chest 4";
pos_card[14, 1] = 0;
pos_card[14, 2] = 85;
pos_card[14, 3] = 83;
pos_card[17, 0] = "Chest 3";
pos_card[17, 1] = 0;
pos_card[17, 2] = 250;
pos_card[17, 3] = 84;
pos_card[3, 0] = "Barrel 1";
pos_card[3, 1] = 0;
pos_card[3, 2] = 7;
pos_card[3, 3] = 47;
pos_card[13, 0] = "Barrel 2";
pos_card[13, 1] = 0;
pos_card[13, 2] = 10;
pos_card[13, 3] = 49;
pos_card[4, 0] = "Shrine 1";
pos_card[4, 1] = 0;
pos_card[4, 2] = 65;
pos_card[4, 3] = 86;
pos_card[9, 0] = "Shrine 2";
pos_card[9, 1] = 0;
pos_card[9, 2] = 75;
pos_card[9, 3] = 87;
pos_card[6, 0] = "Shrine 3";
pos_card[6, 1] = 0;
pos_card[6, 2] = 80;
pos_card[6, 3] = 88;
pos_card[15, 0] = "Shrine 4";
pos_card[15, 1] = 0;
pos_card[15, 2] = 85;
pos_card[15, 3] = 90;
pos_card[18, 0] = "Shrine 5";
pos_card[18, 1] = 0;
pos_card[18, 2] = 120;
pos_card[18, 3] = 89;
pos_card[5, 0] = "Drone1";
pos_card[5, 1] = 0;
pos_card[5, 2] = 75;
pos_card[5, 3] = 73;
pos_card[10, 0] = "Drone2";
pos_card[10, 1] = 0;
pos_card[10, 2] = 105;
pos_card[10, 3] = 74;
pos_card[11, 0] = "Drone3";
pos_card[11, 1] = 0;
pos_card[11, 2] = 105;
pos_card[11, 3] = 76;
pos_card[8, 0] = "Drone4";
pos_card[8, 1] = 0;
pos_card[8, 2] = 105;
pos_card[8, 3] = 75;
pos_card[12, 0] = "Drone5";
pos_card[12, 1] = 0;
pos_card[12, 2] = 135;
pos_card[12, 3] = 77;
pos_card[16, 0] = "Drone6";
pos_card[16, 1] = 0;
pos_card[16, 2] = 115;
pos_card[16, 3] = 78;
pos_card[19, 0] = "Drone7";
pos_card[19, 1] = 0;
pos_card[19, 2] = 125;
pos_card[19, 3] = 79;
