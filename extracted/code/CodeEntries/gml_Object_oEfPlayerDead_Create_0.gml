following = 0;
var tp = instance_nearest(x, y, oP);
show_postgame = players_alive() == 0;
alarm[1] = 480;
vspeed = -2;
hspeed = 2;
rest = 0;
image_speed = 0;
gravity = 0.1;
if (players_alive() == 0)
{
    oHUD.alarm[0] = 10;
    global.director.alarm[0] = 0;
}
text[0] = "You have died. Maybe next time..";
text[1] = "ur dead LOL get wrecked";
text[2] = "DEAD";
text[3] = "Smashed.";
text[4] = "Your family will never know how you died.";
text[5] = "You died painlessly.";
text[6] = "Your death was extremely painful.";
text[7] = "Dead from blunt trauma to the face.";
text[8] = "You have passed away. Try again?";
text[9] = "Your internal organs have failed.";
text[10] = "This planet has killed you.";
text[11] = "Crushed.";
text[12] = "Remember that as time increases, so does difficulty.";
text[13] = "You have broken every bone in your body.";
text[14] = "rekt";
text[15] = "ded";
text[16] = "Sucks to suck.";
text[17] = "They will surely feast on your flesh.";
text[18] = "Remember to activate use items.";
text[19] = "You are dead.";
text[20] = "Get styled upon.";
text[21] = "You walk towards the light.";
text[22] = "You embrace the void.";
text[23] = "Come back soon!";
text[24] = "Your body was gone an hour later.";
text[25] = 'Try playing on "Drizzle" mode for an easier time.';
text[26] = "Choose a new character?";
text[27] = "Consider lowering the difficulty.";
text[28] = "That was definitely not your fault.";
text[29] = "That was absolutely your fault.";
text[30] = "Close!";
text[31] = "..the harder they fall.";
text[32] = "Beep.. beep.. beeeeeeeeeeeeeeeee";
text[33] = "You really messed up.";
text[34] = "It wasn't your time to die...";
text[35] = "You had a lot more to live for.";
text[36] = "Maybe next time.";
text[37] = "You die in a hilarious pose.";
text[38] = "You die a slightly embarassing death.";
text_choice = irandom(38);
drone_count = global.director.drone_count;
tab = 1;
choice = 1;
post_game = 0;
death_minute = oHUD.minute;
death_second = oHUD.second;
death_level = tp.level;
death_item = 0;
oInit.record_char[tp.class] += 1;
for (i = 0; i <= tp.item_count; i += 1)
{
    death_item += tp.item[i, 1];
}
death_item += (tp.use[0] != -1);
death_kills = tp.kill_count;
death_bosses = tp.boss_count;
death_gold = round(oHUD.total_gold);
death_chest = tp.opened_chests;
death_last_hit = tp.last_hit;
death_last_hit_name = tp.last_hit_name;
distance_ran = tp.distance_ran;
death_time_points = ((death_minute * 60) + death_second) * 3;
death_level_points = (death_level * 230) - 230;
death_item_points = death_item * 110;
death_kills_points = round(tp.kill_points * 2);
death_bosses_points = round(tp.boss_points * 200);
death_gold_points = death_gold * 2;
death_chest_points = death_chest * 35;
stages_passed = global.director.stages_passed;
highest_item_stack = 0;
for (i = 0; i <= tp.item_count; i += 1)
{
    highest_item_stack = max(highest_item_stack, tp.item[i, 1]);
}
white_glow = 1;
