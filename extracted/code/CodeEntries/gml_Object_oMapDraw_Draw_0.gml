draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
draw_set_color(c_red);
with (pBlock)
{
    draw_rectangle(ceil(view_xview[0] + (x / 10)), ceil(view_yview[0] + (y / 10)), ceil(view_xview[0] + (x / 10) + 2), ceil(view_yview[0] + (y / 10) + 2), false);
    draw_point_color(view_xview[0], view_yview[0], c_white);
}
