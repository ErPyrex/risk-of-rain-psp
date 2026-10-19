with (oP)
{
    if (visible)
    {
        tdraw_yoffset = 0;
        if (oInit.coop != 2)
        {
            draw_player_below();
            draw_sprite_ext(sprite_index, -1, ceil(x), ceil(y) + tdraw_yoffset, image_xscale, 1, 0, c_white, image_alpha);
            if (class == 4)
            {
                if (half == 1)
                {
                    draw_sprite_ext(sprite_index2, image_index2, ceil(x), ceil(y + ydisp), image_xscale2, 1, 0, c_white, image_alpha);
                }
            }
            if (class == 8 && activity == 2.1)
            {
                var tt = -5;
                tt = collision_line_advanced(x, y, x + (2500 * image_xscale), y, 21, 1, 1);
                if (tt == -5)
                {
                    draw_set_alpha(0.3 + random(0.05));
                    draw_set_color(c_red);
                    draw_line(x, y, x + (2500 * image_xscale), y);
                }
                else
                {
                    draw_set_alpha(0.3 + random(0.05));
                    draw_set_color(c_red);
                    draw_line(x, y, global.collision_x, global.collision_y);
                    draw_circle(global.collision_x, global.collision_y, 2 + random(0.5), irandom(1));
                }
            }
            if (class == 11 && shield_dur != 0)
            {
                d3d_set_fog(true, c_teal, 0, 0);
                draw_set_blend_mode(bm_add);
                draw_sprite_ext(sprite_index, -1, ceil(x), ceil(y) + tdraw_yoffset, image_xscale * random_range(1, 1.2), 1 * random_range(1, 1.2), 0, c_white, random_range(0.8, 0.9));
                draw_set_blend_mode(bm_normal);
                d3d_set_fog(false, c_teal, 0, 0);
            }
        }
        else
        {
            var ping_num = real(string_digits(ping));
            draw_player_below();
            draw_sprite_ext(sprite_index, -1, ceil(ghost_x), ceil(ghost_y), image_xscale, 1, 0, c_white, image_alpha);
            if (class == 4)
            {
                if (half == 1)
                {
                    draw_sprite_ext(sprite_index2, image_index2, ceil(ghost_x), ceil(ghost_y + ydisp), image_xscale2, 1, 0, c_white, image_alpha);
                }
            }
            if (class == 8 && activity == 2.1)
            {
                var tt = -5;
                tt = collision_line_advanced(x, y, x + (2500 * image_xscale), y, 21, 1, 1);
                if (tt == -5)
                {
                    draw_set_alpha(0.3 + random(0.05));
                    draw_set_color(c_red);
                    draw_line(x, y, x + (2500 * image_xscale), y);
                }
                else
                {
                    draw_set_alpha(0.3 + random(0.05));
                    draw_set_color(c_red);
                    draw_line(x, y, global.collision_x, global.collision_y);
                    draw_circle(global.collision_x, global.collision_y, 2 + random(0.5), irandom(1));
                }
            }
            if (class == 11 && shield_dur != 0)
            {
                d3d_set_fog(true, c_teal, 0, 0);
                draw_set_blend_mode(bm_add);
                draw_sprite_ext(sprite_index, -1, ceil(x), ceil(y) + tdraw_yoffset, image_xscale * random_range(1, 1.2), 1 * random_range(1, 1.2), 0, c_white, random_range(0.8, 0.9));
                draw_set_blend_mode(bm_normal);
                d3d_set_fog(false, c_teal, 0, 0);
            }
            if (oInit.coop == 1)
            {
                draw_set_halign(fa_center);
                draw_set_valign(fa_top);
                draw_set_font(global.fntTiny);
                draw_text_color(ceil(x), ceil(y + 5 + 4), string(player_id), oInit.player_color[player_id], oInit.player_color[player_id], oInit.player_color[player_id], oInit.player_color[player_id], 1);
            }
            if (oInit.coop == 2)
            {
                draw_set_halign(fa_center);
                draw_set_valign(fa_top);
                draw_set_font(global.fntTiny);
                w = string_width(user_name);
                draw_set_color(#28273A);
                draw_set_alpha(0.6);
                draw_rectangle(ceil(ghost_x - ((w / 2) + 2)), ceil(ghost_y + 5 + 3), ceil(ghost_x + ((w / 2) + 2)), ceil(ghost_y + 5 + 3 + string_height(user_name) + 1), false);
                draw_set_alpha(1);
                draw_text_color(ceil(ghost_x), ceil(ghost_y) + 5 + 4, user_name, oInit.player_color[player_id], oInit.player_color[player_id], oInit.player_color[player_id], oInit.player_color[player_id], 1);
                if (ping_num > 120)
                {
                    draw_sprite(sLagging, ping_num > 240, ceil(ghost_x) - ((w / 2) + 2) - 6, ceil(ghost_y) + 5 + 3);
                }
            }
        }
        draw_player();
    }
}
