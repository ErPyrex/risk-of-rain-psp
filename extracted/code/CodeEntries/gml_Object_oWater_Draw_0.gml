draw_set_alpha(0.2);
draw_set_color(#7C88B8);
draw_rectangle(view_xview[0], y + yy, view_xview[0] + view_wview[0], view_yview[0] + view_hview[0], false);
draw_rectangle(view_xview[0], (y - 3) + yy, view_xview[0] + view_wview[0], (y + yy) - 1, false);
draw_line_color(view_xview[0], (y - 4) + yy, view_xview[0] + view_wview[0], (y + yy) - 4, #CEECEB, #CEECEB);
draw_set_alpha(1);
