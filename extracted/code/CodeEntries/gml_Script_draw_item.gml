if (used == 1)
{
    draw_set_alpha(image_alpha);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    yo += 0.1;
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_text(round(x), y - yo, text1);
    draw_set_valign(fa_top);
    draw_set_font(global.fntTinyAlt);
    draw_set_color(c_ltgray);
    draw_text(round(x), (y - yo) + 5, text2);
    if (yo >= 30)
    {
        image_alpha -= 0.1;
        if (image_alpha <= 0)
        {
            instance_destroy();
        }
    }
    draw_set_alpha(1);
}
else if (oInit.coop != 2)
{
    draw_sprite_ext(sprite_index, -1, round(x), round(y + yy), 1, 1, 0, c_white, image_alpha);
}
else if (instance_exists(global.my_player))
{
    if (global.my_player.item_value <= (global.director.average_item_value + ceil(global.director.average_item_value * 0.2)) || !global.fair_loot)
    {
        draw_sprite_ext(sprite_index, -1, round(x), round(y + yy), 1, 1, 0, c_white, image_alpha);
    }
    else
    {
        draw_sprite_ext(sprite_index, -1, round(x), round(y + yy), 1, 1, 0, c_white, 0.5);
        draw_sprite(sNoFair, 0, round(x), round(y + yy));
    }
}
