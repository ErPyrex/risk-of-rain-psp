draw_set_color(c_dkgray);
x = view_wview[0] / 2;
y = view_yview[0] + view_hview[0] + 300;
draw_set_color(c_white);
draw_sprite(char[oInit.class - 1], -1, view_wview[0] / 2, (view_yview[0] + view_hview[0]) - 100);
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(sGroundStrip, 0));
texture_set_repeat(1);
i = 140 / number;
while (i > (-30 / number))
{
    draw_vertex_texture(x + lengthdir_x(400, (i + ss) * number), y + 3 + lengthdir_y(400, (i + ss) * number), 0, 0);
    draw_vertex_texture(x + lengthdir_x(400, (i + ss + 1) * number), y + 3 + lengthdir_y(400, (i + ss + 1) * number), 1, 0);
    draw_vertex_texture(x + lengthdir_x(200, (i + ss) * number), y + 3 + lengthdir_y(200, (i + ss) * number), 0, 1);
    draw_vertex_texture(x + lengthdir_x(200, (i + ss + 1) * number), y + 3 + lengthdir_y(200, (i + ss + 1) * number), 1, 1);
    i -= 1;
}
draw_primitive_end();
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_font(global.fntTinyAlt);
for (i = 1; i <= menu[menu_level, 0]; i += 1)
{
    if (choice == i)
    {
        d = 16777215;
    }
    else
    {
        d = 8421504;
    }
    draw_set_color(#1C1A24);
    draw_set_alpha(0.6);
    draw_rectangle((view_xview[0] + (view_wview[0] / 2)) - 6 - (string_width(menu[menu_level, i]) / 2), (view_yview[0] + menu_y_offset + (i * t)) - 2, view_xview[0] + (view_wview[0] / 2) + 2 + (string_width(menu[menu_level, i]) / 2), view_yview[0] + menu_y_offset + (i * t) + string_height(menu[menu_level, i]), false);
    draw_set_alpha(1);
    draw_text_outline(menu[menu_level, i], view_xview[0] + (view_wview[0] / 2), view_yview[0] + menu_y_offset + (i * t), d, 4210752);
    if (i == 4 && oInit.new_item_found != 0)
    {
        draw_sprite(sHighscore, ss * 5, view_xview[0] + (view_wview[0] / 2) + (string_width(menu[menu_level, i]) / 2) + 5, view_yview[0] + menu_y_offset + (i * t));
    }
    if (i == 5 && oInit.new_mons_found != 0)
    {
        draw_sprite(sHighscore, ss * 5, view_xview[0] + (view_wview[0] / 2) + (string_width(menu[menu_level, i]) / 2) + 5, view_yview[0] + menu_y_offset + (i * t));
    }
    if (i == 6 && oInit.trophy_unlocked != 0)
    {
        draw_sprite(sHighscore, ss * 5, view_xview[0] + (view_wview[0] / 2) + (string_width(menu[menu_level, i]) / 2) + 5, view_yview[0] + menu_y_offset + (i * t));
    }
}
draw_set_halign(fa_left);
draw_set_color(c_dkgray);
draw_text(view_xview[0] + 8, view_yview[0] + 8, oInit.version);
draw_set_color(c_black);
draw_set_alpha(black_screen);
draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
draw_set_alpha(1);
