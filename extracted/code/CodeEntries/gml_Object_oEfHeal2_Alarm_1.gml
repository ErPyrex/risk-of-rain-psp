radius = 3 * (value * 0.1);
if (!global.no_surface)
{
    surface = surface_create((radius * 2) + 2, (radius * 2) + 2);
    surface_set_target(surface);
    draw_clear_alpha(c_black, 0);
    draw_set_alpha(1);
    draw_set_color(#88D367);
    draw_circle(radius, radius, 3, 1);
    draw_circle(radius, radius, radius, 1);
    draw_set_alpha(0.4);
    draw_circle(radius, radius, radius, 0);
    draw_point_color(radius, radius, c_white);
    draw_set_alpha(1);
    surface_reset_target();
}
