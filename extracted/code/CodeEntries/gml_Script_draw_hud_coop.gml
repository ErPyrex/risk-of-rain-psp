DX = 0.1;
var vyh = view_yview[0] + view_hview[0];
if (oInit.coop != 1)
{
    exit;
}
for (t = 1; t <= oInit.player_max_chosen; t += 1)
{
    if (instance_exists(oInit.player[t, 2]))
    {
        var vxwdx = view_xview[0] + (view_wview[0] * DX);
        draw_sprite(sHUDOutlineCoop, 0, vxwdx, (vyh + 5) - 84);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_alpha(1);
        draw_set_color(c_red);
        draw_rectangle(vxwdx - 50, vyh - 35, (vxwdx - 50) + (100 * max(0, hpLast[t - 1] / oInit.player[t, 2].maxhp)), vyh - 29, false);
        draw_set_color(health_color[t - 1]);
        draw_rectangle(vxwdx - 50, vyh - 35, (vxwdx - 50) + (100 * max(0, oInit.player[t, 2].hp / oInit.player[t, 2].maxhp)), vyh - 29, false);
        draw_set_color(c_teal);
        draw_set_alpha(0.5);
        if (oInit.player[t, 2].maxshield != 0)
        {
            draw_rectangle(vxwdx - 50, vyh - 35, (vxwdx - 50) + (100 * max(0, oInit.player[t, 2].shield / oInit.player[t, 2].maxshield)), vyh - 29, false);
        }
        draw_set_color(#A8DFDA);
        draw_set_alpha(1);
        draw_rectangle(vxwdx - 50, vyh - 22, (vxwdx - 50) + (100 * max(0, oInit.player[t, 2].expyy / oInit.player[t, 2].maxexp)), vyh - 20, false);
        draw_set_font(oInit.fntTinyOutline);
        draw_set_color(c_white);
        if (oInit.player[t, 2].shield > 0)
        {
            d = 8421376;
        }
        else
        {
            d = 4210752;
        }
        if (oInit.player[t, 2].invincible <= 1)
        {
            draw_text(vxwdx, vyh - 31, string(ceil(oInit.player[t, 2].hp + oInit.player[t, 2].shield)) + "/" + string(oInit.player[t, 2].maxhp));
        }
        else if (oInit.player[t, 2].invincible <= 1000)
        {
            draw_set_alpha(0.8);
            draw_set_color(#EFD27B);
            draw_rectangle(vxwdx - 50, vyh - 35, vxwdx + 50, vyh - 29, false);
            draw_set_alpha(1);
            draw_sprite(sImmune, 0, vxwdx, vyh - 30);
        }
        else
        {
            draw_set_alpha(0.8);
            draw_set_color(c_white);
            draw_rectangle(vxwdx - 50, vyh - 35, vxwdx + 50, vyh - 29, false);
            draw_set_alpha(1);
            draw_sprite(sImmune, 1, vxwdx, vyh - 30);
        }
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_font(global.fntSmall);
        draw_text(vxwdx + 12, vyh - 71, string(oInit.player[t, 2].level));
        for (i = 0; i != 4; i += 1)
        {
            if (i != oInit.player[t, 2].artifact_lock_choice || !global.artifact_lock)
            {
                draw_sprite(oInit.player[t, 2].skill[i, 3], oInit.player[t, 2].skill[i, 4], (vxwdx - 46) + (23 * i), (vyh + 5) - 64);
                if (oInit.player[t, 2].alarm[i + 2] != -1 && oInit.player[t, 2].alarm[i + 2] >= 10 && i != 0)
                {
                    draw_set_color(#1C1A24);
                    draw_set_alpha(0.8);
                    draw_rectangle((vxwdx - 46) + (23 * i), (vyh + 5) - 64, (vxwdx - 28) + (23 * i), (vyh + 5) - 46, false);
                    draw_set_alpha(1);
                    draw_set_font(global.fntSmall);
                    draw_set_color(c_white);
                    draw_set_halign(fa_center);
                    draw_set_valign(fa_middle);
                    draw_text((vxwdx - 36) + (23 * i), (vyh + 5) - 52, real(round(oInit.player[t, 2].alarm[i + 2] / 60)));
                }
            }
            else
            {
                draw_sprite(sMobSkills, 0, (vxwdx - 46) + (23 * i), (vyh + 5) - 64);
                oInit.player[t, 2].alarm[i + 2] = 5;
            }
        }
        for (i = 0; i != 4; i += 1)
        {
            if (mouse_x > ((vxwdx - 46) + (23 * i)) && mouse_x < ((vxwdx - 28) + (23 * i)) && mouse_y > ((vyh + 5) - 64) && mouse_y < ((vyh + 5) - 46))
            {
                draw_set_font(global.fntTiny);
                draw_set_halign(fa_left);
                draw_set_valign(fa_bottom);
                draw_set_color(c_ltgray);
                s = string_height_ext(oInit.player[t, 2].skill[i, 1], 15, 150);
                draw_text_ext((vxwdx - 46) + (23 * i), (vyh + 5) - 94, oInit.player[t, 2].skill[i, 1], 10, 150);
                draw_text_ext((vxwdx - 46) + (23 * i) + 160, (vyh + 5) - 94, string(floor(oInit.player[t, 2].skill[i, 2] / 60) * (1 - oInit.player[t, 2].cdr)) + " sec. cooldown", 15, 150);
                draw_set_font(global.fntSmall);
                draw_set_valign(fa_bottom);
                draw_set_color(c_white);
                draw_text_ext((vxwdx - 46) + (23 * i), (vyh + 5) - 103 - s, oInit.player[t, 2].skill[i, 0], 15, 150);
                draw_set_color(#EFD27B);
                switch (i)
                {
                    case 0:
                        draw_text_ext((vxwdx - 46) + (23 * i) + 160, (vyh + 5) - 83 - s, "[Z]", 15, 150);
                        break;
                    case 1:
                        draw_text_ext((vxwdx - 46) + (23 * i) + 160, (vyh + 5) - 83 - s, "[X]", 15, 150);
                        break;
                    case 2:
                        draw_text_ext((vxwdx - 46) + (23 * i) + 160, (vyh + 5) - 83 - s, "[C]", 15, 150);
                        break;
                    case 3:
                        draw_text_ext((vxwdx - 46) + (23 * i) + 160, (vyh + 5) - 83 - s, "[V]", 15, 150);
                        break;
                }
            }
        }
        if (oInit.player[t, 2].use[0] != -1)
        {
            if (oInit.player[t, 2].alarm[0] == -1)
            {
                draw_sprite(oInit.player[t, 2].use[1], 1, vxwdx + 61, (vyh + 5) - 58);
            }
            if (point_distance(vxwdx + 64, (vyh + 5) - 55, mouse_x, mouse_y) < 30)
            {
                draw_set_halign(fa_left);
                draw_set_valign(fa_bottom);
                draw_set_font(global.fntTiny);
                draw_set_color(#1C1A24);
                draw_set_alpha(0.7);
                draw_rectangle(mouse_x - 3, mouse_y, mouse_x + string_width(oInit.player[t, 2].use[2]), mouse_y - string_height(oInit.player[t, 2].use[2]), false);
                draw_set_color(c_white);
                draw_set_alpha(1);
                draw_text(mouse_x, mouse_y, oInit.player[t, 2].use[2]);
            }
        }
        if (oInit.player[t, 2].alarm[0] != -1)
        {
            draw_sprite_ext(oInit.player[t, 2].use[1], 1, vxwdx + 61, (vyh + 5) - 58, 0.65, 0.65, 0, c_white, 1);
            draw_set_color(#1C1A24);
            draw_set_alpha(0.8);
            draw_rectangle((vxwdx + 64) - 15, (vyh + 5) - 55 - 15, ((vxwdx + 64) - 2) + 12, ((vyh + 5) - 55 - 4) + 14, false);
            draw_set_font(global.fntSmall);
            draw_set_color(c_white);
            draw_set_halign(fa_center);
            draw_set_valign(fa_middle);
            draw_text((vxwdx + 64) - 1, (vyh + 5) - 55 - 2, real(round(oInit.player[t, 2].alarm[0] / 60)));
        }
        DX += 0.25;
    }
}
