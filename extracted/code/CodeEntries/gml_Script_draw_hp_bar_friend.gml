var tiers = min(max(1, maxhp / 3000), 3);
if ((argument0 == 1 || elite == 2) && global.graphics >= 2)
{
    draw_sprite(sMinibossHp, 0, round(x), round(y) - sprite_get_yoffset(sprite_idle) - 7);
    draw_rectangle_color(round(x) - 11 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 2, (round(x) - 11 - min(100, floor(maxhp / tiers / 100))) + 3, round(y) - sprite_get_yoffset(sprite_idle) - 8, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
    draw_rectangle_color(round(x) + 11 + min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 2, (round(x) + 11 + min(100, floor(maxhp / tiers / 100))) - 3, round(y) - sprite_get_yoffset(sprite_idle) - 8, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 0);
}
if (maxhp <= 9000)
{
    if (global.graphics >= 2)
    {
        draw_rectangle_color(round(x) - 11 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 3, round(x) + 11 + min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 7, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    }
    draw_rectangle_color(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, round(x) + 10 + min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 6, c_black, c_black, c_black, c_black, 0);
    draw_set_color(#88D367);
    draw_rectangle(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - min(100, floor(maxhp / tiers / 100))) + ((20 + min(100, 2 * floor(maxhp / tiers / 100))) * (min(3000, hp) / min(3000, maxhp))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    if (hp > 3000)
    {
        draw_set_color(#ACD72D);
        draw_rectangle(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - min(100, floor(maxhp / tiers / 100))) + ((20 + min(100, 2 * floor(maxhp / tiers / 100))) * (min(3000, hp - 3000) / 3000)), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    }
    if (hp > 6000)
    {
        draw_set_color(#E6DA48);
        draw_rectangle(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - min(100, floor(maxhp / tiers / 100))) + ((20 + min(100, 2 * floor(maxhp / tiers / 100))) * (min(3000, hp - 6000) / 3000)), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    }
}
else
{
    if (global.graphics >= 2)
    {
        draw_rectangle_color(round(x) - 11 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 3, round(x) + 11 + min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 7, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1);
    }
    draw_rectangle_color(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, round(x) + 10 + min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 6, c_black, c_black, c_black, c_black, 0);
    draw_set_color(#C93434);
    draw_rectangle(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - min(100, floor(maxhp / tiers / 100))) + ((20 + min(floor((2 * maxhp) / tiers / 100), 200)) * (min(maxhp * (1/3), hp) / min(maxhp * (1/3), maxhp))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    if (hp > (maxhp * (1/3)))
    {
        draw_set_color(#DCA42E);
        draw_rectangle(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - min(100, floor(maxhp / tiers / 100))) + ((20 + min(floor((2 * maxhp) / tiers / 100), 200)) * (min(maxhp * (1/3), hp - (maxhp * (1/3))) / (maxhp * (1/3)))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    }
    if (hp > (maxhp * (2/3)))
    {
        draw_set_color(#E6DA48);
        draw_rectangle(round(x) - 10 - min(100, floor(maxhp / tiers / 100)), round(y) - sprite_get_yoffset(sprite_idle) - 4, (round(x) - 10 - min(100, floor(maxhp / tiers / 100))) + ((20 + min(floor((2 * maxhp) / tiers / 100), 200)) * (min(maxhp * (1/3), hp - (maxhp * (2/3))) / (maxhp * (1/3)))), round(y) - sprite_get_yoffset(sprite_idle) - 6, false);
    }
}
