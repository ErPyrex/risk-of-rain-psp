if (window_get_fullscreen())
{
    screen_width = min(display_get_width());
    screen_height = min(display_get_height());
}
else
{
    screen_width = oInit.res_array[global.res_index, 0];
    screen_height = oInit.res_array[global.res_index, 1];
}
switch (os_type)
{
    case os_psvita:
        scale_max = 1;
        break;
    default:
        scale_max = min(floor(screen_width / 576), floor(screen_height / 360));
        break;
}
scale = min(scale, scale_max);
if (window_get_fullscreen())
{
    view_wview[0] = screen_width / scale;
    view_hview[0] = screen_height / scale;
    window_set_size(display_get_width(), display_get_height());
    surface_resize(application_surface, view_wview[0], view_hview[0]);
}
else
{
    view_wview[0] = ceil(screen_width / scale);
    view_hview[0] = ceil(screen_height / scale);
    window_set_size(ceil(screen_width), ceil(screen_height));
    surface_resize(application_surface, view_wview[0], view_hview[0]);
}
