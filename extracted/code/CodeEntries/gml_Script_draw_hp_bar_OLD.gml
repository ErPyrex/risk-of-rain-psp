if (((alarm[6] != -1 && oHUD.hp_bar_count <= 30) || argument0 != 0 || elite == 2) && ghost == 0)
{
    var tiers = 1;
    if (maxhp > 2000)
    {
        tiers = min(maxhp / 2000, 5);
    }
    if ((argument0 == 1 || elite == 2) && global.graphics >= 2)
    {
        draw_sprite(sMinibossHp, 0, round(x), round(y) - sprite_get_yoffset(sprite_idle) - 7);
        draw_rectangle_color(round(x) - 11 - floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 2, (round(x) - 11 - floor(maxhp / tiers / 100)) + 3, round(y) - sprite_get_yoffset(sprite_idle) - 8, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
        draw_rectangle_color(round(x) + 11 + floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 2, (round(x) + 11 + floor(maxhp / tiers / 100)) - 3, round(y) - sprite_get_yoffset(sprite_idle) - 8, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    }
    if (global.graphics >= 2)
    {
        draw_rectangle_color(round(x) - 11 - floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 3, round(x) + 11 + floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 7, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    }
    draw_rectangle_color(round(x) - 10 - floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 4, round(x) + 10 + floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 6, c_black, c_black, c_black, c_black, 0);
    if (argument0 != 2)
    {
        draw_set_color(#C93434);
    }
    else
    {
        draw_set_color(#88D367);
    }
    draw_rectangle(round(x) - 10 - floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - floor(maxhp / tiers / 100)) + ((20 + floor((2 * maxhp) / tiers / 100)) * (min(2000, hp) / min(2000, maxhp))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    if (hp > 2000)
    {
        draw_set_color(#DCA42E);
        draw_rectangle(round(x) - 10 - floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - floor(maxhp / tiers / 100)) + ((20 + floor((2 * maxhp) / tiers / 100)) * (min(4000, hp - 2000) / min(4000, maxhp))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    }
    if (hp > 6000)
    {
        draw_set_color(#E6DA48);
        draw_rectangle(round(x) - 10 - floor(maxhp / tiers / 100), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - floor(maxhp / tiers / 100)) + ((20 + floor((2 * maxhp) / tiers / 100)) * ((hp - 6000) / max(maxhp - 6000, 4000))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    }
    oHUD.hp_bar_count += 1;
}
