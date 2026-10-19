var x_offset = -2;
var y_offset = 0;
var fat = 0;
white_glow = max(white_glow - 0.1, 0);
chosen_index = min(sprite_get_number(chosen_sprite) - 1, chosen_index + 0.2);
if (shake == 1)
{
    xshake = choose(1, -1) * random(1);
    yshake = choose(1, -1) * random(1);
}
if (global.mouse_on == 1)
{
    temp_choice = -1;
    for (i = 0; i < char_number; i += 1)
    {
        fat = 0;
        if (i == 4)
        {
            fat = 1;
        }
        if (i == 5)
        {
            y_offset = 1;
            x_offset = -7;
        }
        if (mouse_x >= (((view_xview[0] + view_wview[0]) - 16 - 148) + (26 * (i + x_offset)) + xshake) && mouse_x <= (((view_xview[0] + view_wview[0]) - 16 - 148) + (26 * (1 + (i + x_offset + fat))) + xshake) && mouse_y > (view_yview[0] + 8 + yshake + 100 + (87 * y_offset)) && mouse_y < (view_yview[0] + 8 + yshake + 100 + 100 + (87 * y_offset)))
        {
            temp_choice = i;
        }
    }
}
if ((mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate) && temp_choice >= 0)
{
    if (charac[temp_choice, 12] == 1)
    {
        choice = temp_choice;
        chosen_sprite = charac[choice, 1];
        chosen_index = 1;
    }
}
if (mouse_y > ((view_yview[0] + view_hview[0]) - 60) && mouse_x <= ((view_xview[0] + view_wview[0]) - 200) && mouse_y >= (view_xview[0] + 200))
{
    temp_choice = -5;
}
if ((mouse_check_button_pressed(mb_left) == 1 || global.mouse_emulate) && temp_choice == -5)
{
    player[player_choosing, 0] = choice + 1;
    if (keyboard == 1)
    {
        keyboard = 0;
        keyboard_chosen = 1;
        player[player_choosing, 1] = 100;
    }
    else
    {
        player[player_choosing, 1] = gamepad_count;
        gamepad_count += 1;
    }
    choice = 0;
    player_choosing += 1;
    white_glow = 1;
    if (player_choosing > player_max_chosen)
    {
        for (i = 1; i <= player_max_chosen; i += 1)
        {
            oInit.player[i, 0] = player[i, 0];
            oInit.player[i, 1] = player[i, 1];
        }
        oInit.coop = 1;
        oInit.player_max_chosen = player_max_chosen;
        oInit.player_class = choice + 1;
        oInit.current_level = oInit.starting_level;
        var str = "r" + string(oInit.starting_level) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 0])) + "_" + string(irandom_range(1, oInit.level[oInit.starting_level, 1]));
        instance_create(0, 0, oDirectorControl);
        yoyo_room_switching_start();
        global.artifact_elite = oInit.artifact_active[0];
        global.artifact_crew = oInit.artifact_active[1];
        global.artifact_lock = oInit.artifact_active[2];
        global.artifact_death = oInit.artifact_active[3];
        global.artifact_glass = oInit.artifact_active[4];
        global.artifact_use = oInit.artifact_active[5];
        global.artifact_loot = oInit.artifact_active[6];
        global.artifact_command = oInit.artifact_active[7];
        global.artifact_speed = oInit.artifact_active[8];
        global.artifact_imp = oInit.artifact_active[9];
    }
}
