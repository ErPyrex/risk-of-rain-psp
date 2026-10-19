if (inside_view(x, y) == 0 || room == rCutscene4)
{
    exit;
}
if (!elite_tier == -1)
{
    if (elite_tier > 9)
    {
        exit;
    }
}
var mhp13 = maxhp * (1/3);
var tiers = min(max(1, maxhp / 3000), 3);
var rysoff = round(y) - sprite_get_yoffset(sprite_idle);
var mhp = max(hp, 0);
var fmhpt = floor((maxhp / tiers) * 0.005);
var t202min = 20 + (2 * min(100, fmhpt));
var rysid = rysoff - 6;
var rx10min = round(x) - 10 - min(100, fmhpt);
if (((alarm[6] != -1 && oHUD.hp_bar_count <= (10 * global.graphics)) || argument0 != 0 || (elite == 2 && !global.artifact_elite)) && ghost == 0)
{
    if ((argument0 == 1 || (elite == 2 && !global.artifact_elite)) && global.graphics >= 2)
    {
        draw_background_stretched_ext(oHUD.bg_hp, round(x) - 12 - min(100, fmhpt), rysoff - 8, 24 + (2 * min(100, fmhpt)), 7, c_ltgray, 1);
    }
    if (maxhp <= 9000)
    {
        if (global.graphics >= 2)
        {
            draw_background_stretched_ext(oHUD.bg_hp, round(x) - 11 - min(100, fmhpt), rysoff - 7, 22 + (2 * min(100, fmhpt)), 5, c_dkgray, 1);
        }
        draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, 20 + (2 * min(100, fmhpt)), 3, c_black, 1);
        if (hp < 6000)
        {
            draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, t202min * (min(3000, mhp) / min(3000, maxhp)), 3, #C93434, 1);
        }
        if (hp > 3000)
        {
            draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, t202min * (min(3000, mhp - 3000) / 3000), 3, #DCA42E, 1);
        }
        if (hp > 6000)
        {
            draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, t202min * (min(3000, mhp - 6000) / 3000), 3, #E6DA48, 1);
        }
    }
    else
    {
        if (global.graphics >= 2)
        {
            draw_background_stretched_ext(oHUD.bg_hp, round(x) - 11 - min(100, fmhpt), rysoff - 7, 22 + (2 * min(100, fmhpt)), 5, c_dkgray, 1);
        }
        draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, 20 + (2 * min(100, fmhpt)), 3, c_black, 1);
        if (hp < (maxhp * (2/3)))
        {
            draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, t202min * (min(mhp13, mhp) / min(mhp13, maxhp)), 3, #C93434, 1);
        }
        if (hp > mhp13)
        {
            draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, t202min * (min(mhp13, mhp - mhp13) / mhp13), 3, #DCA42E, 1);
        }
        if (hp > (maxhp * (2/3)))
        {
            draw_background_stretched_ext(oHUD.bg_hp, rx10min, rysid, t202min * (min(mhp13, mhp - (maxhp * (2/3))) / mhp13), 3, #E6DA48, 1);
        }
    }
    oHUD.hp_bar_count += 1;
}
