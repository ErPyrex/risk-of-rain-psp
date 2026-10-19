if (global.pause && mouse_cd == 0)
{
    switch (ds_list_find_value(list_active, choice))
    {
        case 48:
            global.joystick_on = !global.joystick_on;
            d_ini_open("Prefs.ini");
            d_ini_write_real("Joystick", "joystick_on", global.joystick_on);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 47:
            global.left_key_gp = 111;
            global.right_key_gp = 112;
            global.up_key_gp = 113;
            global.down_key_gp = 32769;
            global.jump_key_gp = 32769;
            global.z_key_gp = 32776;
            global.x_key_gp = 32775;
            global.c_key_gp = 32773;
            global.v_key_gp = 32774;
            global.use_key_gp = 32770;
            global.yes_key_gp = 32771;
            global.swap_key_gp = 32772;
            d_ini_open("Prefs.ini");
            d_ini_write_real("Key", "left_key_gp", 111);
            d_ini_write_real("Key", "right_key_gp", 112);
            d_ini_write_real("Key", "up_key_gp", 113);
            d_ini_write_real("Key", "down_key_gp", 114);
            d_ini_write_real("Key", "jump_key_gp", 32769);
            d_ini_write_real("Key", "z_key_gp", 32776);
            d_ini_write_real("Key", "x_key_gp", 32775);
            d_ini_write_real("Key", "c_key_gp", 32773);
            d_ini_write_real("Key", "v_key_gp", 32774);
            d_ini_write_real("Key", "use_key_gp", 32770);
            d_ini_write_real("Key", "yes_key_gp", 32771);
            d_ini_write_real("Key", "swap_key_gp", 32772);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 17:
            list_active = list_gp;
            choice = 0;
            caster_play(54, global.volume, 1);
            break;
        case 16:
            global.left_key = 37;
            global.right_key = 39;
            global.up_key = 38;
            global.down_key = 40;
            global.jump_key = 32;
            global.z_key = 90;
            global.x_key = 88;
            global.c_key = 67;
            global.v_key = 86;
            global.use_key = 71;
            global.yes_key = 65;
            global.swap_key = 81;
            d_ini_open("Prefs.ini");
            d_ini_write_real("Key", "left_key", global.left_key);
            d_ini_write_real("Key", "right_key", global.right_key);
            d_ini_write_real("Key", "up_key", global.up_key);
            d_ini_write_real("Key", "down_key", global.down_key);
            d_ini_write_real("Key", "jump_key", global.jump_key);
            d_ini_write_real("Key", "z_key", global.z_key);
            d_ini_write_real("Key", "x_key", global.x_key);
            d_ini_write_real("Key", "c_key", global.c_key);
            d_ini_write_real("Key", "v_key", global.v_key);
            d_ini_write_real("Key", "use_key", global.use_key);
            d_ini_write_real("Key", "yes_key", global.yes_key);
            d_ini_write_real("Key", "swap_key", global.swap_key);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 4:
            change_key = 4;
            keyboard_lastkey = -1;
            break;
        case 5:
            change_key = 5;
            keyboard_lastkey = -1;
            break;
        case 6:
            change_key = 6;
            keyboard_lastkey = -1;
            break;
        case 7:
            change_key = 7;
            keyboard_lastkey = -1;
            break;
        case 8:
            change_key = 8;
            keyboard_lastkey = -1;
            break;
        case 9:
            change_key = 9;
            keyboard_lastkey = -1;
            break;
        case 10:
            change_key = 10;
            keyboard_lastkey = -1;
            break;
        case 11:
            change_key = 11;
            keyboard_lastkey = -1;
            break;
        case 12:
            change_key = 12;
            keyboard_lastkey = -1;
            break;
        case 13:
            change_key = 13;
            keyboard_lastkey = -1;
            break;
        case 14:
            change_key = 14;
            keyboard_lastkey = -1;
            break;
        case 15:
            change_key = 15;
            keyboard_lastkey = -1;
            break;
        case 35:
            change_key = 35;
            break;
        case 36:
            change_key = 36;
            break;
        case 37:
            change_key = 37;
            break;
        case 38:
            change_key = 38;
            break;
        case 39:
            change_key = 39;
            break;
        case 40:
            change_key = 40;
            break;
        case 41:
            change_key = 41;
            break;
        case 42:
            change_key = 42;
            break;
        case 43:
            change_key = 43;
            break;
        case 44:
            change_key = 44;
            break;
        case 45:
            change_key = 45;
            break;
        case 46:
            change_key = 46;
            break;
        case 23:
            global.frame_skip = !global.frame_skip;
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "frame_skip", global.frame_skip);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 31:
            global.no_item_message = !global.no_item_message;
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "no_item_message", global.no_item_message);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 25:
            global.music_volume = global.music_volume + 0.1;
            if (global.music_volume > 1)
            {
                global.music_volume = 0;
            }
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "music_volume", global.music_volume);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 24:
            global.volume = global.volume + 0.1;
            if (global.volume > 1)
            {
                global.volume = 0;
            }
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "volume", global.volume);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 30:
            global.damage_on = !global.damage_on;
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "damage_on", global.damage_on);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 34:
            if (!window_get_fullscreen())
            {
                global.res_index++;
                if (global.res_index == array_height_2d(oInit.res_array) || global.res_index > oInit.res_recommended)
                {
                    global.res_index = 0;
                }
                d_ini_open("Prefs.ini");
                d_ini_write_real("Video Options", "res_index", global.res_index);
                d_ini_close();
                with (oInit)
                {
                    scale_refresh();
                }
                caster_play(54, global.volume, 1);
            }
            break;
        case 22:
            global.graphics += 1;
            if (global.graphics > 3)
            {
                global.graphics = 1;
            }
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "graphics", global.graphics);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 33:
            global.vsync = !global.vsync;
            display_reset(0, global.vsync);
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "vsync", global.vsync);
            d_ini_close();
            with (oInit)
            {
                scale_refresh();
            }
            caster_play(54, global.volume, 1);
            break;
        case 20:
            oInit.scale++;
            if (oInit.scale > oInit.scale_max)
            {
                oInit.scale = 1;
            }
            with (oInit)
            {
                scale_refresh();
            }
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "scale", oInit.scale);
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 19:
            window_set_fullscreen(!window_get_fullscreen());
            with (oInit)
            {
                scale_refresh();
            }
            d_ini_open("Prefs.ini");
            d_ini_write_real("Video Options", "fullscreen", window_get_fullscreen());
            d_ini_close();
            caster_play(54, global.volume, 1);
            break;
        case 3:
            list_active = list_main;
            choice = 0;
            caster_play(54, global.volume, 1);
            break;
        case 32:
            global.pause = 0;
            instance_activate_all();
            if (sprite_exists(pause_sprite))
            {
                sprite_delete(pause_sprite);
            }
            audio_resume_sound(global.music_id);
            caster_play(54, global.volume, 1);
            break;
        case 18:
            if (room != rStart)
            {
                list_active = list_default;
            }
            else
            {
                list_active = list_alt;
            }
            choice = 0;
            caster_play(54, global.volume, 1);
            break;
        case 1:
            list_active = list_av;
            choice = 0;
            caster_play(54, global.volume, 1);
            break;
        case 2:
            list_active = list_controls;
            choice = 0;
            caster_play(54, global.volume, 1);
            break;
        case 28:
            list_active = list_default;
            choice = 0;
            global.pause = 0;
            instance_activate_all();
            if (sprite_exists(pause_sprite))
            {
                sprite_delete(pause_sprite);
            }
            if (room != rStart)
            {
                audio_resume_sound(global.music_id);
                global.enemy_buff = 1;
                current_level = 0;
                oInit.init = 0;
                d_ini_open("Save.ini");
                for (i = 0; i <= global.artifact_number; i += 1)
                {
                    if (oInit.artifact_found_temp[i] != 0)
                    {
                        if (oInit.artifact_found[i] == 0)
                        {
                            oInit.artifact_found[i] = 1;
                            d_ini_write_real("Record", "artifact" + string(i), 1);
                        }
                        else
                        {
                            oInit.artifact_found_temp[i] = 0;
                        }
                    }
                }
                for (i = 0; i <= oInit.achievement_number; i += 1)
                {
                    if (oInit.achievement[i, 0] == 1)
                    {
                        oInit.achievement[i, 0] = 2;
                        d_ini_write_real("Achievement", "achievement" + string(i), 2);
                        oInit.achievement_number_unlocked += 1;
                        d_ini_write_real("Record", "achievement_number_unlocked", oInit.achievement_number_unlocked);
                    }
                    if (oInit.achievement[i, 5] == 1)
                    {
                        oInit.achievement[i, 1] = 0;
                    }
                    else
                    {
                        d_ini_write_real("Achievement", "achievement_progress" + string(i), oInit.achievement[i, 1]);
                    }
                }
                for (i = 0; i <= global.item_number; i += 1)
                {
                    if (oInit.item_found_temp[i] != 0)
                    {
                        if (oInit.item_found[i] == 0)
                        {
                            oInit.new_item_found += 1;
                            oInit.item_number_unlocked += 1;
                            oInit.item_found[i] = 1;
                            d_ini_write_real("Record", "item" + string(i), 1);
                            d_ini_write_real("Record", "item_number_unlocked", oInit.item_number_unlocked);
                        }
                        else
                        {
                            oInit.item_found_temp[i] = 0;
                        }
                    }
                }
                for (i = 0; i <= global.mons_number; i += 1)
                {
                    if (oInit.mons_found_temp[i] != 0)
                    {
                        if (oInit.mons_found[i] == 0)
                        {
                            oInit.new_mons_found += 1;
                            oInit.mons_number_unlocked += 1;
                            oInit.mons_found[i] = 1;
                            d_ini_write_real("Record", "mons" + string(i), 1);
                            d_ini_write_real("Record", "mons_number_unlocked", oInit.mons_number_unlocked);
                        }
                        else
                        {
                            oInit.mons_found_temp[i] = 0;
                        }
                    }
                }
                d_ini_close();
                room_goto(rStart);
            }
            break;
    }
    mouse_cd = 15;
}
exit;
if (global.pause == 1 && mouse_cd == 0)
{
    mouse_cd = 4;
    switch (menu_level)
    {
        case 0:
            switch (choice)
            {
                case 1:
                    global.pause = 0;
                    instance_activate_all();
                    if (sprite_exists(pause_sprite))
                    {
                        sprite_delete(pause_sprite);
                    }
                    audio_resume_sound(global.music_id);
                    break;
                case 2:
                    d_ini_open("Prefs.ini");
                    menu_level = 1;
                    break;
                case 3:
                    menu_level = 2;
                    break;
                case 4:
                    menu_level = 3;
                    break;
                case 5:
                    if (room != rStart)
                    {
                        menu_level = 3;
                    }
                    else
                    {
                        global.pause = 0;
                        instance_activate_all();
                        if (sprite_exists(pause_sprite))
                        {
                            sprite_delete(pause_sprite);
                        }
                    }
                    break;
            }
            break;
        case 1:
            switch (choice)
            {
                case 1:
                    window_set_fullscreen(!window_get_fullscreen());
                    global.fullscreen = !global.fullscreen;
                    d_ini_write_real("Video Options", "fullscreen", global.fullscreen);
                    break;
                case 2:
                    oInit.scale_loaded += 1;
                    if (oInit.scale_loaded > oInit.scale_max)
                    {
                        oInit.scale_loaded = 1;
                    }
                    d_ini_write_real("Video Options", "scale", oInit.scale_loaded);
                    break;
                case 3:
                    d_ini_write_real("Video Options", "no_surface", global.no_surface);
                    break;
                case 4:
                    global.graphics += 1;
                    if (global.graphics > 3)
                    {
                        global.graphics = 1;
                    }
                    d_ini_write_real("Video Options", "graphics", global.graphics);
                    break;
                case 5:
                    global.damage_on = !global.damage_on;
                    d_ini_write_real("Video Options", "damage_on", global.damage_on);
                    break;
                case 6:
                    break;
                case 7:
                    global.volume = global.volume + 0.1;
                    if (global.volume > 1)
                    {
                        global.volume = 0;
                    }
                    d_ini_write_real("Video Options", "volume", global.volume);
                    break;
                case 8:
                    global.music_volume = global.music_volume + 0.1;
                    if (global.music_volume > 1)
                    {
                        global.music_volume = 0;
                    }
                    d_ini_write_real("Video Options", "music_volume", global.music_volume);
                    break;
                case 9:
                    global.graphics_auto = !global.graphics_auto;
                    d_ini_write_real("Video Options", "graphics_auto", global.graphics_auto);
                    break;
                case 10:
                    global.show_border = !global.show_border;
                    d_ini_write_real("Video Options", "show_border", global.show_border);
                    break;
                case 11:
                    global.no_item_message = !global.no_item_message;
                    d_ini_write_real("Video Options", "no_item_message", global.no_item_message);
                    break;
                default:
                    if (choice == menu[menu_level, 0])
                    {
                        if (room == rStart)
                        {
                            menu_level = 5;
                        }
                        else
                        {
                            menu_level = 0;
                        }
                        choice = 0;
                        d_ini_close();
                    }
                    break;
            }
            break;
        case 2:
            break;
        case 3:
            switch (choice)
            {
                case 1:
                    menu_level = 0;
                    global.pause = 0;
                    instance_activate_all();
                    if (sprite_exists(pause_sprite))
                    {
                        sprite_delete(pause_sprite);
                    }
                    if (room != rStart)
                    {
                        audio_resume_sound(global.music_id);
                        global.enemy_buff = 1;
                        current_level = 0;
                        oInit.init = 0;
                        d_ini_open("Save.ini");
                        for (i = 0; i <= global.artifact_number; i += 1)
                        {
                            if (oInit.artifact_found_temp[i] != 0)
                            {
                                if (oInit.artifact_found[i] == 0)
                                {
                                    oInit.artifact_found[i] = 1;
                                    d_ini_write_real("Record", "artifact" + string(i), 1);
                                }
                                else
                                {
                                    oInit.artifact_found_temp[i] = 0;
                                }
                            }
                        }
                        for (i = 0; i <= oInit.achievement_number; i += 1)
                        {
                            if (oInit.achievement[i, 0] == 1)
                            {
                                oInit.achievement[i, 0] = 2;
                                d_ini_write_real("Achievement", "achievement" + string(i), 2);
                                oInit.achievement_number_unlocked += 1;
                                d_ini_write_real("Record", "achievement_number_unlocked", oInit.achievement_number_unlocked);
                            }
                            if (oInit.achievement[i, 5] == 1)
                            {
                                oInit.achievement[i, 1] = 0;
                            }
                            else
                            {
                                d_ini_write_real("Achievement", "achievement_progress" + string(i), oInit.achievement[i, 1]);
                            }
                        }
                        for (i = 0; i <= global.item_number; i += 1)
                        {
                            if (oInit.item_found_temp[i] != 0)
                            {
                                if (oInit.item_found[i] == 0)
                                {
                                    oInit.new_item_found += 1;
                                    oInit.item_number_unlocked += 1;
                                    oInit.item_found[i] = 1;
                                    d_ini_write_real("Record", "item" + string(i), 1);
                                    d_ini_write_real("Record", "item_number_unlocked", oInit.item_number_unlocked);
                                }
                                else
                                {
                                    oInit.item_found_temp[i] = 0;
                                }
                            }
                        }
                        for (i = 0; i <= global.mons_number; i += 1)
                        {
                            if (oInit.mons_found_temp[i] != 0)
                            {
                                if (oInit.mons_found[i] == 0)
                                {
                                    oInit.new_mons_found += 1;
                                    oInit.mons_number_unlocked += 1;
                                    oInit.mons_found[i] = 1;
                                    d_ini_write_real("Record", "mons" + string(i), 1);
                                    d_ini_write_real("Record", "mons_number_unlocked", oInit.mons_number_unlocked);
                                }
                                else
                                {
                                    oInit.mons_found_temp[i] = 0;
                                }
                            }
                        }
                        d_ini_close();
                        room_goto(rStart);
                    }
                    break;
                case 2:
                    if (room == rStart)
                    {
                        menu_level = 5;
                    }
                    else
                    {
                        menu_level = 0;
                    }
                    break;
            }
            break;
        case 4:
            if (choice != menu[menu_level, 0] && choice != 1 && choice != 15 && global.joystick_on == 1)
            {
                change_joy = choice;
            }
            else if (choice == 1)
            {
                global.joystick_on = !global.joystick_on;
            }
            break;
        case 5:
            switch (choice)
            {
                case 1:
                    menu_level = 0;
                    global.pause = 0;
                    instance_activate_all();
                    if (sprite_exists(pause_sprite))
                    {
                        sprite_delete(pause_sprite);
                    }
                    audio_resume_sound(global.music_id);
                    break;
                case 2:
                    d_ini_open("Prefs.ini");
                    menu_level = 1;
                    break;
                case 3:
                    menu_level = 2;
                    break;
            }
            break;
    }
    choice = 1;
}
