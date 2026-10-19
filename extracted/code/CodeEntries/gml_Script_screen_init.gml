screen_x = 0;
screen_y = 0;
screen_w = global.width;
screen_h = global.height;
screen_scale = scale;
if (global.no_surface == 0)
{
    screen = surface_create(screen_w, screen_h);
    if (screen == -1)
    {
        global.no_surface = 1;
    }
    else
    {
        global.no_surface = 0;
    }
}
