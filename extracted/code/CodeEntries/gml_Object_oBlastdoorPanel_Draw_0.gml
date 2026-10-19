draw_set_alpha(1);
draw_sprite(sprite_index, -1, x, y);
if (can_activate == 1 && active == 0)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        draw_ctext(x - 104, y - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to open blast door. Are you ready?");
    }
    else
    {
        draw_ctext(x - 104, y - 32, "Press '" + string_key(global.yes_key_gp) + "' to open blast door. Are you ready?");
    }
}
if (active == 1)
{
    if (floor(time / 60) == (time / 60))
    {
        s = instance_create(x, y, oEfCircle);
    }
    if (random(100) < 40)
    {
        part_particles_create_color(global.below, x, y, global.pHeal, 12750215, 1);
    }
    draw_rectangle_color(x - 21, y - sprite_yoffset - 3, x + 21, y - sprite_yoffset - 7, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(x - 20, y - sprite_yoffset - 4, x + 20, y - sprite_yoffset - 6, c_black, c_black, c_black, c_black, 0);
    draw_set_color(#878DC2);
    draw_rectangle(x - 20, y - sprite_yoffset - 4, (x - 20) + (40 * (time / maxtime)), y - sprite_yoffset - 6, false);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    draw_text(x, y - 44, "STAY ALIVE..!");
    if (oInit.coop != 1)
    {
        with (oInit.player[1, 2])
        {
            draw_text(round(x), round(y - 34), string(ceil(other.time / 60)) + "/" + string(other.maxtime / 60) + " seconds");
        }
        oHUD.objective_text = "Stay alive!";
    }
    else
    {
        oHUD.objective_text = string(ceil(time / 60)) + "/" + string(maxtime / 60) + " seconds";
    }
}
