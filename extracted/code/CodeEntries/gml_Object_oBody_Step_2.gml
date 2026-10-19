if (floor(image_index) == shake_frame && shook == 0)
{
    shook = 1;
    oHUD.alarm[0] = 9;
}
if (parent > 0)
{
    if (instance_exists(parent))
    {
        x = parent.x + x_off;
        y = parent.y + y_off + parent.fall_speed;
    }
    else
    {
        instance_destroy();
    }
}
