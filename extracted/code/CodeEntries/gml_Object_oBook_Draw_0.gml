for (i = 0; i < floor((view_hview[0] - 32) * 0.59); i += 1)
{
    draw_background(bBinding, (view_xview[0] + (view_wview[0] * 0.5)) - 10, view_yview[0] + 16 + (i * 29));
}
draw_set_alpha((0.1 + random(0.01)) * book_alpha);
draw_rectangle_color((view_xview[0] + (view_wview[0] * 0.5)) - book_width, view_yview[0] + 16, (view_xview[0] + (view_wview[0] * 0.5)) - 15, view_yview[0] + 16 + book_height, c_black, c_black, c_black, c_black, 0);
draw_rectangle_color(view_xview[0] + (view_wview[0] * 0.5) + 15, view_yview[0] + 16, view_xview[0] + (view_wview[0] * 0.5) + book_width, view_yview[0] + 16 + book_height, c_black, c_black, c_black, c_black, 0);
draw_sprite_ext(sBookCorner, current_time / 300, ((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + corner_offset, view_yview[0] + 16 + corner_offset, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, (view_xview[0] + (view_wview[0] * 0.5)) - 15 - corner_offset, view_yview[0] + 16 + (corner_offset * 0.6), -1, 1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, ((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + corner_offset, (view_yview[0] + 16 + book_height) - corner_offset, 1, -1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, (view_xview[0] + (view_wview[0] * 0.5)) - 15 - corner_offset, (view_yview[0] + 16 + book_height) - (corner_offset * 0.6), -1, -1, 0, c_white, 1);
draw_sprite_ext(sBookProj, current_time / 80, (((view_xview[0] + (view_wview[0] * 0.5)) - 15) + (corner_offset * 0.3)) - 3, view_yview[0] + 16 + (book_height * 0.5), -1, 1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, view_xview[0] + (view_wview[0] * 0.5) + 15 + (corner_offset * 0.6), view_yview[0] + 16 + corner_offset, 1, 1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, (view_xview[0] + (view_wview[0] * 0.5) + book_width) - corner_offset, view_yview[0] + 16 + corner_offset, -1, 1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, view_xview[0] + (view_wview[0] * 0.5) + 15 + (corner_offset * 0.6), (view_yview[0] + 16 + book_height) - corner_offset, 1, -1, 0, c_white, 1);
draw_sprite_ext(sBookCorner, current_time / 300, (view_xview[0] + (view_wview[0] * 0.5) + book_width) - corner_offset, (view_yview[0] + 16 + book_height) - (corner_offset * 0.6), -1, -1, 0, c_white, 1);
draw_sprite_ext(sBookProj, current_time / 80, (view_xview[0] + (view_wview[0] * 0.5) + 15 + 2) - (corner_offset * 0.3), view_yview[0] + 16 + (book_height * 0.5), 1, 1, 0, c_white, 1);
draw_set_alpha(book_alpha);
draw_set_color(c_gray);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(global.fntTiny);
draw_text((view_xview[0] + (view_wview[0] * 0.5)) - (book_width * 0.5) - 7, view_yview[0] + book_height + 8, string((page * 2) + 2));
draw_text(view_xview[0] + (view_wview[0] * 0.5) + (book_width * 0.5) + 7, view_yview[0] + book_height + 8, string((page * 2) + 3));
draw_set_alpha(book_alpha);
var d;
if (page < max_page && page != -1)
{
    if (point_distance(mouse_x, mouse_y, view_xview[0] + (view_wview[0] * 0.5) + book_width + 10, view_yview[0] + 16 + floor(book_height * 0.5)) < 15)
    {
        d = 16777215;
    }
    else
    {
        d = 8114927;
    }
    d3d_set_fog(true, d, 0, 0);
    draw_sprite_ext(sArrow, 0, view_xview[0] + (view_wview[0] * 0.5) + book_width + 10, view_yview[0] + 16 + floor(book_height * 0.5), 1, 1, 0, c_white, book_alpha);
    d3d_set_fog(false, d, 0, 0);
}
if (page != -1)
{
    if (point_distance(mouse_x, mouse_y, (view_xview[0] + (view_wview[0] * 0.5)) - book_width - 10, view_yview[0] + 16 + floor(book_height * 0.5)) < 15)
    {
        d = 16777215;
    }
    else
    {
        d = 8114927;
    }
    d3d_set_fog(true, d, 0, 0);
    draw_sprite_ext(sArrow, 0, (view_xview[0] + (view_wview[0] * 0.5)) - book_width - 10, view_yview[0] + 16 + floor(book_height * 0.5), -1, 1, 0, c_white, book_alpha);
    d3d_set_fog(false, d, 0, 0);
}
if (page >= 0)
{
    if (global.menu_delay == 0)
    {
    }
    if (mons[page, 6] == 1)
    {
        draw_sprite_ext(sPortrait, page, (view_xview[0] + (view_wview[0] * 0.5)) - (book_width * 0.5) - 7, view_yview[0] + 16 + floor(book_height * 0.5) + 12, 1, 1, 0, c_white, book_alpha);
        draw_sprite_ext(mons[page, 5], current_time / 85, (view_xview[0] + (view_wview[0] * 0.5) + book_width + sprite_get_xoffset(mons[page, 5])) - sprite_get_width(mons[page, 5]) - 8, view_yview[0] + 16 + sprite_get_yoffset(mons[page, 5]) + 8, -1, 1, 0, c_white, book_alpha);
        draw_set_font(global.fntSmall);
        draw_text_outline(mons[page, 0], (view_xview[0] + (view_wview[0] * 0.5)) - (book_width * 0.5) - 7, view_yview[0] + 16 + 32, 16777215, 4210752);
        if (oInit.mons_found_temp[page] != 0)
        {
            draw_sprite_ext(sHighscore, current_time / 400, (view_xview[0] + (view_wview[0] * 0.5)) - (book_width * 0.5) - 7 - 31, view_yview[0] + 16 + 32, 1, 1, 0, c_white, book_alpha);
        }
        draw_set_font(global.fntTinyAlt);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 15 + 8, view_yview[0] + 16 + 32, "Health: &g&" + string(mons[page, 2]) + " points&!&");
        draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 15 + 8, view_yview[0] + 16 + 32 + 14, "Damage: &y&" + string(mons[page, 3]) + " points&!&");
        draw_ctext(view_xview[0] + (view_wview[0] * 0.5) + 15 + 8, view_yview[0] + 16 + 32 + 28, "Top Speed: &b&" + string(ceil(mons[page, 4] * 60 * 0.5454545454545454 * 0.3048 * 2.23694 * 0.5)) + " mph&!&");
        draw_text_ext(view_xview[0] + (view_wview[0] * 0.5) + 15 + 8, view_yview[0] + 16 + 32 + 42, "Field Notes: " + mons[page, 1], 10, book_width - 16);
    }
}
if (page == -1)
{
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_ltgray);
    draw_text_ext(view_xview[0] + (view_wview[0] * 0.5) + 15 + 8, view_yview[0] + 16 + 32, "Monster Logs contain information, lore, and custom art of enemies found on the planet.##Monster Log entries have a small chance of dropping whenever you kill an enemy.###Good hunting!", 10, book_width - 16);
    if (global.joystick_on && global.menu_delay == 0)
    {
    }
    if (global.mouse_on)
    {
        table_choice = -1;
    }
    var pg = 0;
    var h = 0;
    ii = 0;
    draw_set_color(c_white);
    for (i = 0; i <= max_page; i += 1)
    {
        if (floor(i / 7) > h)
        {
            h += 1;
        }
        if (mouse_x > (((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20) && mouse_x < (((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + 32) && mouse_y > (view_yview[0] + 16 + 16 + (h * 37) + 8) && mouse_y < (view_yview[0] + 16 + 16 + (h * 37) + 8 + 32) && global.mouse_on)
        {
            table_choice = i;
        }
        if (table_choice == i)
        {
            draw_set_alpha(0.4 * book_alpha);
            draw_rectangle(((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20, view_yview[0] + 16 + 16 + (h * 37) + 8, ((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + 32, view_yview[0] + 16 + 16 + (h * 37) + 8 + 32, false);
        }
        if (mons[i, 6] == 1)
        {
            if (oInit.mons_found_temp[i] == 1)
            {
                draw_set_alpha(0.2 * book_alpha);
                if ((current_second * 0.5) == round(current_second * 0.5))
                {
                    draw_set_color(#EFD27B);
                }
                else
                {
                    draw_set_color(#CF6666);
                }
                draw_rectangle(((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20, view_yview[0] + 16 + 16 + (h * 37) + 8, ((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + 32, view_yview[0] + 16 + 16 + (h * 37) + 8 + 32, false);
                draw_set_color(c_gray);
            }
            if (mons[i, 2] > 1000)
            {
                draw_set_alpha(0.6 * book_alpha);
                draw_rectangle_color(((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20, view_yview[0] + 16 + 16 + (h * 37) + 8, ((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + 32, view_yview[0] + 16 + 16 + (h * 37) + 8 + 32, boss_color, boss_color, boss_color, boss_color, 0);
            }
            else
            {
                draw_set_alpha(0.2 * book_alpha);
                draw_rectangle_color(((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20, view_yview[0] + 16 + 16 + (h * 37) + 8, ((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + 32, view_yview[0] + 16 + 16 + (h * 37) + 8 + 32, mons_color, mons_color, mons_color, mons_color, 0);
            }
            if ((mouse_check_button_pressed(mb_left) == 1 && global.mouse_on) && table_choice == i)
            {
                flipping_pages = 1;
                flipping_pages_jump = i + 1;
            }
            draw_set_alpha(0.4 * book_alpha);
            draw_sprite_part_ext(mons[i, 5], current_time / 85, max(sprite_get_xoffset(mons[i, 5]) - 16, 0), 0, min(32, sprite_get_width(mons[i, 5])), min(32, sprite_get_height(mons[i, 5])), ((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + (16 - min(sprite_get_xoffset(mons[i, 5]), 16)), view_yview[0] + 16 + 16 + (h * 37) + 8 + (16 - min(sprite_get_yoffset(mons[i, 5]), 16)), 1, 1, c_white, book_alpha);
        }
        draw_set_alpha(0.4 * book_alpha);
        draw_rectangle(((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20, view_yview[0] + 16 + 16 + (h * 37) + 8, ((((view_xview[0] + (view_wview[0] * 0.5)) - book_width) + (37 * i)) - (h * 37 * 7)) + 20 + 32, view_yview[0] + 16 + 16 + (h * 37) + 8 + 32, true);
    }
}
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_alpha(1);
draw_set_font(global.fntTiny);
draw_text_outline("Monster Log", view_xview[0] + (view_wview[0] * 0.5), view_yview[0] + 7, 16777215, 4210752);
draw_set_valign(fa_bottom);
if (choice == 1)
{
    d = 16777215;
}
else
{
    d = 8421504;
}
if (page == -1)
{
    draw_text_outline("Back to main menu", view_xview[0] + (view_wview[0] * 0.5), (view_yview[0] + view_hview[0]) - 12, d, 4210752);
}
else
{
    draw_text_outline("Back to Table of Contents", view_xview[0] + (view_wview[0] * 0.5), (view_yview[0] + view_hview[0]) - 12, d, 4210752);
}
draw_set_color(c_black);
draw_set_alpha(black_screen);
draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
draw_set_alpha(1);
