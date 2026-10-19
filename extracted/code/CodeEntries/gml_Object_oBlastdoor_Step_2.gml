if (abs(opening) != 2)
{
    if (random(100) < (offset_v * 10))
    {
        repeat (3)
        {
            part_particles_create(global.middle, x + choose(offset, -offset) + 117, y - choose(0, 236), global.pSpark, 1);
        }
    }
    if (offset <= (offset_max / 2))
    {
        offset_v += (0.004 * opening);
        offset += (offset_v * opening);
        if (offset_v <= 0 && opening == -1)
        {
            opening *= 2;
            oHUD.alarm[0] = 10;
        }
    }
    else
    {
        if (!destroyed)
        {
            instance_activate_region(x + 194, y - 70, 2, 2, true);
            with (collision_point(x + 194, y - 70, oBNoSpawn, 1, 1))
            {
                instance_destroy();
            }
        }
        offset_v -= (0.004 * opening);
        offset += (offset_v * opening);
        if (offset_v <= 0 && opening)
        {
            opening *= 2;
            oHUD.alarm[0] = 10;
        }
    }
}
