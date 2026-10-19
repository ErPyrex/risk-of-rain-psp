draw_drone();
if (warping != 0)
{
    var t = collision_line_advanced(x, y, x, y + 3000, 43, 0, 0);
    if (t > 0)
    {
        x_laser = global.collision_x;
        y_laser = global.collision_y;
        draw_set_blend_mode(bm_add);
        draw_set_alpha(0.1 + random(0.1));
        draw_set_color(tlaser_color);
        draw_line(x, y, global.collision_x, global.collision_y);
        draw_set_blend_mode(bm_normal);
    }
}
if (instance_exists(tt) == 0 && tt != -10)
{
    if (instance_exists(master))
    {
        master.alarm[5] = master.skill[3, 2] * (1 - master.cdr);
        if (master.scepter == 0)
        {
            master.skill[3, 4] = 4;
        }
        else
        {
            master.skill[3, 4] = 6;
        }
    }
    tt = -10;
    hp_position = 0;
    name_position = 0;
    previous_tt = tt;
    scan_position = 0;
}
else
{
    with (tt)
    {
        var tlaser_color = 255;
        if (instance_exists(other.master))
        {
            if (other.master.scepter != 0)
            {
                tlaser_color = 65535;
                apply_buff(id, 1, 0);
            }
        }
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, tlaser_color, 0.3);
        if (image_angle == 0)
        {
            draw_sprite_part_ext(sprite_index, -1, 0, 0 + other.scan_position, sprite_get_width(sprite_index), min(10, sprite_get_height(sprite_index) - other.scan_position), x - sprite_xoffset, (y - sprite_yoffset) + other.scan_position, image_xscale + random(0.04), image_yscale + random(0.04), tlaser_color, 0.9);
        }
        else
        {
            draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, tlaser_color, 0.9);
        }
        draw_set_alpha(0.1 + random(0.05));
        draw_set_color(tlaser_color);
        draw_rectangle((x - sprite_get_xoffset(sprite_idle)) + sprite_get_width(sprite_idle) + 3, y - sprite_get_yoffset(sprite_idle) - 2, (x - sprite_get_xoffset(sprite_idle)) + sprite_get_width(sprite_idle) + 6 + max(string_width(name), string_width(string(round(maxhp)) + "/" + string(round(maxhp)))), (y - sprite_get_yoffset(sprite_idle)) + 22, true);
        draw_rectangle((x - sprite_get_xoffset(sprite_idle)) + sprite_get_width(sprite_idle) + 3, y - sprite_get_yoffset(sprite_idle) - 2, (x - sprite_get_xoffset(sprite_idle)) + sprite_get_width(sprite_idle) + 6 + max(string_width(name), string_width(string(round(maxhp)) + "/" + string(round(maxhp)))), (y - sprite_get_yoffset(sprite_idle)) + 22, false);
        draw_sprite_ext(sEfSniper, 3, x, y, 1, 1, 0, tlaser_color, 0.5);
        draw_set_blend_mode(bm_normal);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_alpha(0.6 + random(0.05));
        draw_set_font(global.fntTiny);
        var name_bar;
        if (other.alarm[0] == -1)
        {
            name_bar = "";
        }
        else
        {
            name_bar = "_";
        }
        var hp_bar;
        if (other.alarm[1] == -1 && other.alarm[0] == -1)
        {
            hp_bar = "";
        }
        else
        {
            hp_bar = "_";
        }
        draw_text((x - sprite_get_xoffset(sprite_idle)) + sprite_get_width(sprite_idle) + 5, y - sprite_get_yoffset(sprite_idle), string_copy(name, 0, other.name_position) + name_bar);
        draw_text((x - sprite_get_xoffset(sprite_idle)) + sprite_get_width(sprite_idle) + 5, (y - sprite_get_yoffset(sprite_idle)) + 10, string_copy(string(round(hp)) + "/" + string(round(maxhp)), 0, other.hp_position) + hp_bar);
        other.scan_position += (1 * other.scan_direction);
        if ((other.scan_position > sprite_get_height(sprite_index) && other.scan_direction == 1) || (other.scan_position < 0 && other.scan_direction == -1))
        {
            other.scan_direction = -other.scan_direction;
        }
    }
}
