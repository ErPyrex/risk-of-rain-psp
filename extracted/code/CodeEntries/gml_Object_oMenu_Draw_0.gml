if (global.pause)
{
    if (sprite_exists(pause_sprite))
    {
        draw_sprite_ext(pause_sprite, 0, view_xview[0], view_yview[0], 1, 1, 0, c_white, 1);
    }
    draw_set_alpha(0.9);
    draw_rectangle_color(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], c_black, c_black, c_black, c_black, 0);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var tlist_size = ds_list_size(list_active);
    var ttext_height;
    switch (list_active)
    {
        case list_default:
            var tbig = 1;
            ttext_height = 32;
            draw_set_font(global.fntSmall);
            break;
        case list_alt:
            var tbig = 1;
            ttext_height = 32;
            draw_set_font(global.fntSmall);
            break;
        default:
            var tbig = 0;
            ttext_height = 20;
            draw_set_font(global.fntTiny);
            break;
    }
    var view_xm = view_xview[0] + (view_wview[0] / 2);
    var view_ym = view_yview[0] + (view_hview[0] / 2);
    choice = -1;
    for (i = 0; i < tlist_size; i++)
    {
        var text_y = view_ym + ((i - (tlist_size / 2)) * ttext_height);
        var text_x = view_xm;
        var ttext = "test";
        if (point_in_rectangle(mouse_x, mouse_y, view_xview[0], (text_y - (ttext_height / 2)) + 3, view_xview[0] + view_wview[0], (text_y + (ttext_height / 2)) - 3))
        {
            choice = i;
        }
        var d;
        if (choice == i)
        {
            d = 16777215;
        }
        else
        {
            d = 8421504;
        }
        switch (ds_list_find_value(list_active, i))
        {
            case 32:
                ttext = "Resume";
                break;
            case 1:
                ttext = "Audio and Video";
                break;
            case 2:
                ttext = "Controls (Keyboard)";
                break;
            case 17:
                ttext = "Controls (Gamepad)";
                break;
            case 3:
                ttext = "Return to main menu";
                break;
            case 19:
                ttext = "Fullscreen: ";
                break;
            case 34:
                ttext = "Window Resolution: ";
                break;
            case 33:
                ttext = "V-Sync: ";
                break;
            case 20:
                ttext = "Zoom Scale: ";
                break;
            case 21:
                ttext = "Enable Surfaces: ";
                break;
            case 22:
                ttext = "Graphics: ";
                break;
            case 30:
                ttext = "Damage Numbers: ";
                break;
            case 23:
                ttext = "Frame Skip: ";
                break;
            case 24:
                ttext = "Game Volume: ";
                break;
            case 25:
                ttext = "Music Volume: ";
                break;
            case 26:
                ttext = "Auto-Adjust Graphics: ";
                break;
            case 27:
                ttext = "Borderless Window: ";
                break;
            case 31:
                ttext = "Item Notification: ";
                break;
            case 18:
                ttext = "Back";
                break;
            case 48:
                ttext = "Gamepad Support: ";
                break;
            case 35:
                ttext = "Move Left: ";
                break;
            case 36:
                ttext = "Move Right: ";
                break;
            case 37:
                ttext = "Climb Up: ";
                break;
            case 38:
                ttext = "Climb Down: ";
                break;
            case 39:
                ttext = "Jump: ";
                break;
            case 40:
                ttext = "Ability 1: ";
                break;
            case 41:
                ttext = "Ability 2: ";
                break;
            case 42:
                ttext = "Ability 3: ";
                break;
            case 43:
                ttext = "Ability 4: ";
                break;
            case 44:
                ttext = "Use Item: ";
                break;
            case 45:
                ttext = "Enter: ";
                break;
            case 46:
                ttext = "Swap Item: ";
                break;
            case 47:
                ttext = "Reset to default ";
                break;
            case 4:
                ttext = "Move Left: ";
                break;
            case 5:
                ttext = "Move Right: ";
                break;
            case 6:
                ttext = "Climb Up: ";
                break;
            case 7:
                ttext = "Climb Down: ";
                break;
            case 8:
                ttext = "Jump: ";
                break;
            case 9:
                ttext = "Ability 1: ";
                break;
            case 10:
                ttext = "Ability 2: ";
                break;
            case 11:
                ttext = "Ability 3: ";
                break;
            case 12:
                ttext = "Ability 4: ";
                break;
            case 13:
                ttext = "Use Item: ";
                break;
            case 14:
                ttext = "Enter: ";
                break;
            case 15:
                ttext = "Swap Item: ";
                break;
            case 16:
                ttext = "Reset to default ";
                break;
            case 28:
                ttext = "Yes, quit and return to main menu.";
                break;
            default:
                ttext = "test";
                break;
        }
        draw_set_halign(fa_center);
        switch (ds_list_find_value(list_active, i))
        {
            case 48:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (global.joystick_on)
                {
                    ttext2 = "On";
                }
                else
                {
                    ttext2 = "Off";
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 45:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 45)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.yes_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 46:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 46)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.swap_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 44:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 44)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.use_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 43:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 43)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.v_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 42:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 42)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.c_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 41:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 41)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.x_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 40:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 40)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.z_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 39:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 39)
                {
                    ttext2 = "Press any button";
                }
                else
                {
                    ttext2 = string(string_key(global.jump_key_gp));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 16777215, 4210752);
                break;
            case 14:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 14)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.yes_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 15:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 15)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.swap_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 13:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 13)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.use_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 12:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 12)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.v_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 11:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 11)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.c_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 10:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 10)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.x_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 9:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 9)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.z_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 8:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 8)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.jump_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 7:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 7)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.down_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 6:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 6)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.up_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 5:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 5)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.right_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 4:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (change_key == 4)
                {
                    ttext2 = "Press any key";
                }
                else
                {
                    ttext2 = string(string_key(global.left_key));
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 23:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (global.frame_skip)
                {
                    ttext2 = "On";
                }
                else
                {
                    ttext2 = "Off";
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 31:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (!global.no_item_message)
                {
                    ttext2 = "On";
                }
                else
                {
                    ttext2 = "Off";
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 25:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                draw_text_outline(string(round(global.music_volume * 100)) + "%", text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 24:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                draw_text_outline(string(round(global.volume * 100)) + "%", text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 30:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (global.damage_on)
                {
                    ttext2 = "On";
                }
                else
                {
                    ttext2 = "Off";
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 22:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                switch (global.graphics)
                {
                    case 1:
                        ttext2 = "Low";
                        break;
                    case 2:
                        ttext2 = "Medium";
                        break;
                    case 3:
                        ttext2 = "High";
                        break;
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 34:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var tcolor;
                if (window_get_fullscreen())
                {
                    tcolor = 8421504;
                }
                else
                {
                    tcolor = 8114927;
                }
                draw_text_outline(string(oInit.res_array[global.res_index, 0]) + "x" + string(oInit.res_array[global.res_index, 1]), text_x + (string_width(ttext) / 2), text_y, tcolor, 4210752);
                break;
            case 33:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (global.vsync)
                {
                    ttext2 = "On";
                }
                else
                {
                    ttext2 = "Off";
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 19:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                var ttext2;
                if (window_get_fullscreen())
                {
                    ttext2 = "On";
                }
                else
                {
                    ttext2 = "Off";
                }
                draw_text_outline(ttext2, text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            case 20:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                draw_set_halign(fa_left);
                draw_text_outline(string(oInit.scale) + "X", text_x + (string_width(ttext) / 2), text_y, 8114927, 4210752);
                break;
            default:
                draw_text_outline(ttext, text_x, text_y, d, 4210752);
                break;
        }
    }
}
