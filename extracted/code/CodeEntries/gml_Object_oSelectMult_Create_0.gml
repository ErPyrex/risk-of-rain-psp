char_sprite[0, 0] = 970;
char_sprite[1, 0] = 971;
char_sprite[2, 0] = 974;
char_sprite[3, 0] = 977;
char_sprite[4, 0] = 975;
char_sprite[5, 0] = 976;
char_sprite[6, 0] = 973;
char_sprite[7, 0] = 979;
char_sprite[8, 0] = 978;
char_sprite[9, 0] = 980;
char_sprite[10, 0] = 981;
char_sprite[11, 0] = 982;
for (i = 0; i <= 11; i += 1)
{
    char_sprite[i, 1] = 0;
    char_sprite[i, 2] = 0;
    char_sprite[i, 3] = 0;
}
artifact[0] = "&p&-HONOR-&!&#Enemies always spawn as elites.";
artifact[1] = "&p&-KIN-&!&#Only one enemy type spawns per stage.";
artifact[2] = "&p&-DISTORTION-&!&#Lock a random skill every minute.";
artifact[3] = "&p&-SPITE-&!&#Enemies explode on death.";
artifact[4] = "&p&-GLASS-&!&#Deal 500% damage, but have 10% health.";
artifact[5] = "&p&-ENIGMA-&!&#Use items have a random effect.";
artifact[6] = "&p&-SACRIFICE-&!&#Chests no longer spawn; monsters now drop items on death.";
artifact[7] = "&p&-COMMAND-&!&#Items are no longer random.";
artifact[8] = "&p&-SPIRIT-&!&#Characters run faster at lower health.";
artifact[9] = "&p&-ORIGIN-&!&#Imps invade the map every 10 minutes.";
char_sprite[0, 1] = 1;
char_sprite[1, 1] = sign(oInit.achievement[14, 0]);
char_sprite[2, 1] = sign(oInit.achievement[6, 0]);
char_sprite[3, 1] = sign(oInit.achievement[20, 0]);
char_sprite[4, 1] = sign(oInit.achievement[17, 0]);
char_sprite[5, 1] = sign(oInit.achievement[23, 0]);
char_sprite[6, 1] = sign(oInit.achievement[26, 0]);
char_sprite[7, 1] = sign(oInit.achievement[29, 0]);
char_sprite[8, 1] = sign(oInit.achievement[32, 0]);
char_sprite[9, 1] = sign(oInit.achievement[47, 0]);
char_sprite[10, 1] = sign(oInit.achievement[52, 0]);
char_sprite[11, 1] = sign(oInit.achievement[49, 0]);
for (i = 1; i <= 4; i += 1)
{
    player[i, 0] = -1;
    player[i, 1] = -1;
    player[i, 2] = -1;
    player[i, 3] = 0;
    player[i, 4] = -1;
    player[i, 5] = -1;
    player[i, 6] = "";
}
player_id = 1;
player_max_chosen = 1;
players_locked = 0;
launching = 0;
pressed = 0;
diff[0] = "&g&-DRIZZLE-&!&#Reduces difficulty for players new to the game.#Weeping and gnashing is replaced by #laughter and tickles.#&r&Progress is not saved in this mode.&!&";
diff[1] = "&y&-RAINSTORM-&!&#The way the game is meant to be played!# Test your abilities and skills against formidable foes.";
diff[2] = "&r&-MONSOON-&!&#For hardcore players. #Every bend introduces pain and horrors of the planet. #You will die.";
