with (oHUD)
{
    var vxv6 = view_xview[0] + 6;
    var vxw2 = view_xview[0] + (view_wview[0] * 0.5);
    if (global.graphics >= 2)
    {
        draw_background_stretched(bg_backdrop_hp, view_xview[0] + 4, view_yview[0] + 4, view_wview[0] - 8, 12);
    }
    draw_background_stretched(bg_empty_hp, vxv6, view_yview[0] + 6, view_wview[0] - 12, 9);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6, view_wview[0] - 12, 9, #B44949, 1);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 7, view_wview[0] - 12, 3, c_white, 0.4);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6, ((view_wview[0] - 12) * other.wurm_1hp) / other.wurm_1maxhp, 4, #C65A13, 1);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6, ((view_wview[0] - 12) * other.wurm_1hp) / other.wurm_1maxhp, 2, c_white, 0.4);
    draw_background_stretched(bg_backdrop_hp, vxv6, view_yview[0] + 6 + 4, view_wview[0] - 12, 1);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6 + 5, ((view_wview[0] - 12) * other.wurm_2hp) / other.wurm_2maxhp, 4, #C65A13, 1);
    draw_background_stretched_ext(bg_hp, vxv6, view_yview[0] + 6 + 5, ((view_wview[0] - 12) * other.wurm_2hp) / other.wurm_2maxhp, 2, c_white, 0.4);
    draw_set_font(global.fntSmall);
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    draw_set_color(#FFFFB3);
    draw_text(vxw2, view_yview[0] + 19, "Gilded Wurms");
    draw_set_font(global.fntTiny);
    draw_set_color(c_ltgray);
    draw_text(vxw2, view_yview[0] + 36, "Hands of Providence");
    draw_set_color(c_white);
    draw_text(vxw2, view_yview[0] + 6, string(ceil(max(other.wurm_1hp + other.wurm_2hp, 0))) + "/" + string(ceil(other.wurm_1maxhp + other.wurm_2maxhp)));
}
