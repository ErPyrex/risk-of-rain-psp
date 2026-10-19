draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(global.fntMedium);
draw_text_outline("Item Log", view_xview[0] + (view_wview[0] / 2), view_yview[0] + 16, 16777215, 4210752);
draw_set_font(global.fntSmall);
var d;
if (choice == 1)
{
    d = 16777215;
}
else
{
    d = 8421504;
}
draw_text_outline("Back", view_xview[0] + (view_wview[0] / 2), (view_yview[0] + view_hview[0]) - 32, d, 4210752);
var s = -1;
var t = 0;
if (global.mouse_on && menu_level == 0)
{
    item_choice = -1;
}
for (i = 0; i <= global.item_number; i += 1)
{
    t += 1;
    if ((view_xview[0] + (t * 36) + 16) > ((view_xview[0] + view_wview[0]) - 32))
    {
        s += 1;
        t = 1;
    }
    draw_set_alpha(0.5);
    draw_set_color(c_gray);
    if (mouse_x >= ((view_xview[0] + 16 + (t * 36)) - 12) && mouse_x <= (view_xview[0] + 16 + (t * 36) + 12) && mouse_y >= (((view_yview[0] + 90) - 12) + (s * 40)) && mouse_y <= (view_yview[0] + 90 + 12 + (s * 40)) && menu_level == 0 && global.mouse_on == 1)
    {
        draw_set_color(c_ltgray);
        draw_rectangle((view_xview[0] + 16 + (t * 36)) - 14, ((view_yview[0] + 90) - 14) + (s * 40), view_xview[0] + 17 + (t * 36) + 14, view_yview[0] + 90 + 15 + (s * 40), false);
        item_choice = i;
        if (menu_level == 0 && mouse_check_button_pressed(mb_left) == 1 && item[i, 6] == 1)
        {
            menu_level = 1;
            oInit.item_found_temp[i] = 0;
        }
    }
    if (global.mouse_on == 0 && i == item_choice)
    {
        draw_set_color(c_ltgray);
        draw_rectangle((view_xview[0] + 16 + (t * 36)) - 14, ((view_yview[0] + 90) - 14) + (s * 40), view_xview[0] + 17 + (t * 36) + 14, view_yview[0] + 90 + 15 + (s * 40), false);
    }
    if (oInit.item_found_temp[i] != 0)
    {
        if ((current_second / 2) == round(current_second / 2))
        {
            draw_set_color(#EFD27B);
        }
        else
        {
            draw_set_color(#CF6666);
        }
        draw_rectangle((view_xview[0] + 16 + (t * 36)) - 14, ((view_yview[0] + 90) - 14) + (s * 40), view_xview[0] + 17 + (t * 36) + 14, view_yview[0] + 90 + 15 + (s * 40), false);
        draw_set_alpha(0.8);
    }
    draw_rectangle((view_xview[0] + 16 + (t * 36)) - 16, ((view_yview[0] + 90) - 16) + (s * 40), view_xview[0] + 16 + (t * 36) + 16, view_yview[0] + 90 + 16 + (s * 40), true);
    if (item[i, 6] == 1)
    {
        draw_sprite_ext(item[i, 4], 1, view_xview[0] + 16 + (t * 36), view_yview[0] + 90 + (s * 40), 1, 1, 0, c_white, 1);
    }
    else if (item[i, 6] == 0)
    {
        draw_sprite_ext(item[i, 4], 1, view_xview[0] + 16 + (t * 36), view_yview[0] + 90 + (s * 40), 1, 1, 0, c_black, 0.7);
    }
    else if (oInit.achievement[item[i, 3], 8] == 99 || oInit.achievement[oInit.achievement[item[i, 3], 8], 0] != 0)
    {
        draw_sprite(sRandom, abs(item[i, 6]), view_xview[0] + 16 + (t * 36), view_yview[0] + 90 + (s * 40));
    }
    else
    {
        draw_sprite(sRandom, 2, view_xview[0] + 16 + (t * 36), view_yview[0] + 90 + (s * 40));
    }
}
t = 0;
s = -1;
for (i = 0; i <= global.item_number; i += 1)
{
    t += 1;
    if ((view_xview[0] + 16 + (t * 36) + 16) > ((view_xview[0] + view_wview[0]) - 32))
    {
        s += 1;
        t = 1;
    }
    if (i == item_choice && menu_level == 0)
    {
        if (item[i, 6] == -1 || item[i, 3] != -1)
        {
            draw_set_font(global.fntTiny);
            if (item[i, 6] == -1)
            {
                draw_set_color(c_white);
            }
            else
            {
                draw_set_color(#EFD27B);
            }
            draw_set_halign(fa_right);
            var dx, dy;
            if (global.mouse_on == 1)
            {
                dx = mouse_x;
                dy = mouse_y;
            }
            else
            {
                dx = view_xview[0] + 16 + (t * 36);
                dy = view_yview[0] + 90 + (s * 40);
            }
            if (dx >= (view_wview[0] / 2))
            {
                draw_set_halign(fa_right);
                d = 1;
            }
            else
            {
                draw_set_halign(fa_left);
                d = -1;
            }
            if (oInit.achievement[item[i, 3], 8] == 99 || oInit.achievement[oInit.achievement[item[i, 3], 8], 0] != 0)
            {
                draw_rectangle_color(dx + (8 * d), dy - 12, dx - ((string_width(oInit.achievement[item[i, 3], 6] + " [LOCKED]") + 8) * d), (dy - 12) + string_height(oInit.achievement[item[i, 3], 6] + " [LOCKED]"), c_black, c_black, c_black, c_black, 0);
            }
            else
            {
                draw_rectangle_color(dx + (8 * d), dy - 12, dx - ((string_width("You cannot unlock this yet.") + 8) * d), (dy - 12) + string_height("You cannot unlock this yet."), c_black, c_black, c_black, c_black, 0);
            }
            draw_set_alpha(1);
            if (item[i, 6] == -1)
            {
                if (oInit.achievement[item[i, 3], 8] == 99 || oInit.achievement[oInit.achievement[item[i, 3], 8], 0] != 0)
                {
                    draw_text(dx, dy - 12, oInit.achievement[item[i, 3], 6] + " [LOCKED]");
                }
                else
                {
                    draw_set_color(c_red);
                    draw_text(dx, dy - 12, "You cannot unlock this yet.");
                }
            }
            else
            {
                draw_text(dx, dy - 12, oInit.achievement[item[i, 3], 6] + " [DONE]");
            }
        }
    }
}
if (menu_level == 1)
{
    draw_set_alpha(0.9);
    draw_set_color(#1C1A24);
    draw_rectangle(view_xview[0] + 8, view_yview[0] + 8, (view_xview[0] + view_wview[0]) - 8, (view_yview[0] + view_hview[0]) - 8, false);
    draw_rectangle(view_xview[0] + 8, view_yview[0] + 8, (view_xview[0] + view_wview[0]) - 8, (view_yview[0] + view_hview[0]) - 8, true);
    draw_set_font(global.fntSmall);
    draw_set_halign(fa_left);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_ctext(view_xview[0] + 42, view_yview[0] + 98 + -16, "&y&Shipping Details: &!&");
    draw_set_font(global.fntTinyAlt);
    draw_sprite(item[item_choice, 4], 0, view_xview[0] + 42 + string_width("-Order: " + item[item_choice, 0]) + 16, view_yview[0] + 98 + 16);
    draw_ctext(view_xview[0] + 42, view_yview[0] + 98 + 25, "&lt&-Order:&!& &b&" + item[item_choice, 0] + "&!&");
    draw_ctext(view_xview[0] + 52, view_yview[0] + 98 + 50, "&dk&Tracking Number: " + string(item[item_choice, 4]) + "***********&!&");
    draw_ctext(view_xview[0] + 42, view_yview[0] + 98 + 75, "&lt&-Order Description:&!& " + item[item_choice, 1]);
    draw_ctext(view_xview[0] + 42, view_yview[0] + 98 + 100, "&lt&-Shipping Method:&!& " + item[item_choice, 2]);
    draw_ctext(view_xview[0] + 16, (view_yview[0] + view_hview[0]) - 16, "&dk&For questions and complaints, please contact our &!&&b&customer service.&!&");
    draw_set_color(c_ltgray);
    draw_text_ext(view_xview[0] + 42, view_yview[0] + 98 + 125 + string_height_ext("-Order Details: " + item[item_choice, 8], 10, view_wview[0] - string_width("-Order Details: ")), "-Order Details: " + item[item_choice, 8], 10, view_wview[0] - string_width("-Order Details: "));
    draw_set_color(c_ltgray);
    draw_set_valign(fa_top);
    draw_text(view_xview[0] + 16, view_yview[0] + 16, "Estimated Delivery:#" + item[item_choice, 7]);
    draw_text((view_xview[0] + view_wview[0]) - 105, view_yview[0] + 16, "Sent to:#" + item[item_choice, 5]);
    draw_set_color(#EFD27B);
    draw_line_width(view_xview[0] + 32, (view_yview[0] + 98) - 16, view_xview[0] + 168 + 42 + 16, (view_yview[0] + 98) - 16, 2);
    if (mouse_x >= ((view_xview[0] + view_wview[0]) - 16) && mouse_y > (view_yview[0] + 8) && mouse_y <= (view_yview[0] + 19))
    {
        if (mouse_check_button_pressed(mb_left) == 1)
        {
            menu_level = 0;
            item_choice = -1;
        }
        draw_sprite(sClose, 1, (view_xview[0] + view_wview[0]) - 16, view_yview[0] + 8);
    }
    else
    {
        draw_sprite(sClose, 0, (view_xview[0] + view_wview[0]) - 16, view_yview[0] + 8);
    }
}
draw_set_color(c_black);
draw_set_alpha(black_screen);
draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
draw_set_alpha(1);
