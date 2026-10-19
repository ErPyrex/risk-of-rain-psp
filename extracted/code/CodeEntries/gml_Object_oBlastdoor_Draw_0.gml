draw_set_alpha(1);
draw_sprite(sBlastdoorLeftFrame, left_frame_index + 1, x, y);
draw_sprite_part(sBlastdoor, left_door_index, offset, 0, 92 - offset, 236, x + 32, y - 236);
draw_sprite_part(sBlastdoor, right_door_index, -offset, 0, 171, 236, x + 32, y - 236);
draw_sprite(sBlastdoorLeftFrame, left_frame_index, x, y);
