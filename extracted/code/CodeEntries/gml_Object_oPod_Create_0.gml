target = instance_nearest(oP.x, oP.y, oB);
if (instance_exists(target))
{
    if (target.x > oP.x)
    {
        x = target.x + 48;
    }
    else
    {
        x = target.x + random(target.width_box * 16);
    }
    y = target.y;
}
achievement_id = 6;
alarm[0] = 60;
visible = false;
image_speed = 0;
