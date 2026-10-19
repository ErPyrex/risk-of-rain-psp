image_speed = 0;
image_index = sprite_get_number(sprite_index) - 1;
if (parent < 0)
{
    oBodyCollector.body[oBodyCollector.bodyCount2, 0] = sprite_index;
    oBodyCollector.body[oBodyCollector.bodyCount2, 1] = image_index;
    oBodyCollector.body[oBodyCollector.bodyCount2, 2] = x;
    oBodyCollector.body[oBodyCollector.bodyCount2, 3] = y;
    oBodyCollector.body[oBodyCollector.bodyCount2, 4] = image_xscale;
    oBodyCollector.body[oBodyCollector.bodyCount2, 5] = image_blend;
    oBodyCollector.body[oBodyCollector.bodyCount2, 6] = sprite_palette;
    if (oBodyCollector.bodyCount < 25)
    {
        oBodyCollector.bodyCount += 1;
        oBodyCollector.bodyCount2 += 1;
    }
    else if (oBodyCollector.bodyCount2 == 25)
    {
        oBodyCollector.bodyCount2 = 0;
    }
    else
    {
        oBodyCollector.bodyCount2 += 1;
    }
    instance_destroy();
}
