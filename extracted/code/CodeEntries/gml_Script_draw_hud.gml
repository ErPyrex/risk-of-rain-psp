var tcol = 2365980;
var vxw2 = view_xview[0] + (view_wview[0] * 0.5);
var vyh = view_yview[0] + view_hview[0];
for (i = 0; i < ceil(oInit.player[1, 2].mark_tally / 5); i += 1)
{
    draw_sprite(sHitlistTicks, min(4, oInit.player[1, 2].mark_tally - 1 - (i * 5)), (vxw2 - 46) + (12 * i), vyh - 72);
}
for (i = 0; i != 4; i += 1)
{
    var i23 = 23 * i;
    if (i != oInit.player[1, 2].artifact_lock_choice || !global.artifact_lock)
    {
        draw_sprite(oInit.player[1, 2].skill[i, 3], oInit.player[1, 2].skill[i, 4], (vxw2 - 46) + i23, vyh - 64);
        if (oInit.player[1, 2].alarm[i + 2] != -1 && oInit.player[1, 2].alarm[i + 2] >= 10 && i != 0)
        {
            draw_set_color(tcol);
            draw_set_alpha(0.8);
            draw_rectangle((vxw2 - 46) + i23, vyh - 64, (vxw2 - 28) + i23, vyh - 46, false);
            draw_set_alpha(1);
            draw_set_font(global.fntSmall);
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text((vxw2 - 36) + i23, vyh - 53, real(round(oInit.player[1, 2].alarm[i + 2] / 60)));
        }
    }
    else
    {
        draw_sprite(sMobSkills, 0, (vxw2 - 46) + i23, vyh - 64);
        oInit.player[1, 2].alarm[i + 2] = 5;
    }
}
if (argument0 != -1)
{
    draw_set_font(global.fntTiny);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_color(c_ltgray);
    s = string_height_ext(oInit.player[1, 2].skill[argument0, 1], 15, 150);
    draw_text_ext((vxw2 - 46) + (23 * argument0), vyh - 94, oInit.player[1, 2].skill[argument0, 1], 10, 150);
    draw_text_ext((vxw2 - 46) + (23 * argument0) + 160, vyh - 94, string(floor(oInit.player[1, 2].skill[argument0, 2] / 60) * (1 - oInit.player[1, 2].cdr)) + " sec. cooldown", 15, 150);
    draw_set_font(global.fntSmall);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_text_ext((vxw2 - 46) + (23 * argument0), vyh - 103 - s, oInit.player[1, 2].skill[argument0, 0], 15, 150);
    draw_set_color(#EFD27B);
    switch (argument0)
    {
        case 0:
            draw_text_ext((vxw2 - 46) + (23 * argument0) + 160, vyh - 83 - s, "[Z]", 15, 150);
            break;
        case 1:
            draw_text_ext((vxw2 - 46) + (23 * argument0) + 160, vyh - 83 - s, "[X]", 15, 150);
            break;
        case 2:
            draw_text_ext((vxw2 - 46) + (23 * argument0) + 160, vyh - 83 - s, "[C]", 15, 150);
            break;
        case 3:
            draw_text_ext((vxw2 - 46) + (23 * argument0) + 160, vyh - 83 - s, "[V]", 15, 150);
            break;
    }
}
if (oInit.player[1, 2].use[0] != -1)
{
    if (oInit.player[1, 2].alarm[0] == -1)
    {
        draw_sprite(oInit.player[1, 2].use[1], 1, vxw2 + 61, vyh - 58);
    }
    if (point_distance(vxw2 + 64, vyh - 55, mouse_x, mouse_y) < 30)
    {
        draw_set_halign(fa_left);
        draw_set_valign(fa_bottom);
        draw_set_font(global.fntTiny);
        draw_set_color(tcol);
        draw_set_alpha(0.7);
        draw_rectangle(mouse_x - 3, mouse_y, mouse_x + string_width(oInit.player[1, 2].use[2]), mouse_y - string_height(oInit.player[1, 2].use[2]), false);
        draw_set_color(c_white);
        draw_set_alpha(1);
        draw_text(mouse_x, mouse_y, oInit.player[1, 2].use[2]);
    }
}
if (oInit.player[1, 2].alarm[0] != -1)
{
    draw_sprite_ext(oInit.player[1, 2].use[1], 1, vxw2 + 61, vyh - 58, 0.65, 0.65, 0, c_white, 1);
    draw_set_color(tcol);
    draw_set_alpha(0.8);
    draw_rectangle((vxw2 + 64) - 15, vyh - 55 - 15, ((vxw2 + 64) - 2) + 12, (vyh - 55 - 4) + 14, false);
    draw_set_font(global.fntSmall);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text((vxw2 + 64) - 1, vyh - 54, real(round(oInit.player[1, 2].alarm[0] / 60)));
}
