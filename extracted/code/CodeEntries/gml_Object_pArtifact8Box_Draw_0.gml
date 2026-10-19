var tr = 0;
var tc = 0;
if ((oInit.coop != 2 || global.my_player == owner) && instance_exists(owner))
{
    draw_set_color(c_black);
    draw_set_alpha(fade_alpha);
    draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
    for (i = 0; i <= count; i += 1)
    {
        tx = x + ((tc - 4) * 40);
        ty = (y - 130) + (tr * 40);
        draw_set_color(c_white);
        draw_set_alpha(0.5 * (fade_alpha / 0.3));
        draw_rectangle(tx - 16, ty - 16, tx + 16, ty + 16, true);
        if (selection == i)
        {
            draw_set_color(#7EB686);
            draw_rectangle(tx - 14, ty - 14, tx + 14, ty + 14, false);
        }
        switch (type)
        {
            case 1:
                draw_sprite_ext(object_get_sprite(global.director.item_tier1[i, 0]), 0, tx, ty, 1, 1, 0, c_white, random_range(0.9, 1) * (fade_alpha / 0.3));
                break;
            case 2:
                draw_sprite_ext(object_get_sprite(global.director.item_tier2[i, 0]), 0, tx, ty, 1, 1, 0, c_white, random_range(0.9, 1) * (fade_alpha / 0.3));
                break;
            case 3:
                draw_sprite_ext(object_get_sprite(global.director.item_tier3[i, 0]), 0, tx, ty, 1, 1, 0, c_white, random_range(0.9, 1) * (fade_alpha / 0.3));
                break;
            case 4:
                draw_sprite_ext(object_get_sprite(global.director.item_use[i, 0]), 0, tx, ty, 1, 1, 0, c_white, random_range(0.9, 1) * (fade_alpha / 0.3));
                break;
        }
        tc += 1;
        if (tc == 10)
        {
            tc = 0;
            tr += 1;
        }
    }
}
if (oInit.coop == 2 && owner != global.my_player && active == 1)
{
    draw_sprite(sRandom, 4, x, y - 32);
    if (random(100) < 60)
    {
        part_particles_create_color(global.below, (x - 6) + random(12), y, global.pHeal, 12750215, 1);
    }
}
draw_self();
if (can_activate == 1 && active == 0)
{
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_white);
    if (global.joystick_on == 0)
    {
        with (oHUD)
        {
            draw_ctext(other.x - 60, round(other.y) - 32, "Press &y&'" + string_key(global.yes_key) + "'&!& to choose an item.");
        }
    }
    else
    {
        with (oHUD)
        {
            draw_ctext(other.x - 60, round(other.y) - 32, "Press '" + string_key(global.yes_key_gp) + "' to purchase choose an item.");
        }
    }
}
