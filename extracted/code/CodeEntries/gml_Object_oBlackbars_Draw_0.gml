draw_set_alpha(1);
draw_set_color(c_black);
draw_rectangle(view_xview[0], view_yview[0], view_xview[0] + view_wview[0], view_yview[0] + (view_hview[0] * 0.15 * coeff), false);
draw_rectangle(view_xview[0], view_yview[0] + view_hview[0], view_xview[0] + view_wview[0], (view_yview[0] + view_hview[0]) - (view_hview[0] * 0.15 * coeff), false);
