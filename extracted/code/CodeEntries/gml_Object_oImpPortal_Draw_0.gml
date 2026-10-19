draw_set_alpha(0.4);
draw_set_color(#C148A4);
draw_circle(x, y, 40 + offset + random(5), 0);
draw_set_color(#C148A4);
draw_circle(x, y, 10 + offset + random(5), 0);
draw_set_alpha(0.9);
draw_circle_color(x, y, random(5), c_white, c_white, 0);
for (i = 0; i < 360; i += 30)
{
    draw_sprite_ext(sImpPortal, 0, x + lengthdir_x(40 + offset, image_angle + i), y + lengthdir_y(40 + offset, image_angle + i), 1, 1, image_angle + i + (offset * 3), c_white, 1);
}
