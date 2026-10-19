draw_self();
draw_sprite_ext(sHologram, current_time, x, y - 30, 1, 1, 0, c_white, projecting_alpha - random(0.03));
draw_sprite_ext(sHologramPointer, image_index / 2, (x - sprite_get_xoffset(sHologram)) + xx, ((y - sprite_get_yoffset(sHologram)) + yy) - 30, 1, 1, 0, c_white, projecting_alpha - random(0.03));
