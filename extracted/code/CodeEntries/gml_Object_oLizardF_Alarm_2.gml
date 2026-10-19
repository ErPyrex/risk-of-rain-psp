if (landing == 0)
{
    image_speed = 0.2;
    intended_speed = 1.3;
    if (oInit.coop != 2)
    {
        alarm[1] = 60 * random_range(3, 5);
    }
    else
    {
        alarm[1] = 240;
    }
    sprite_index = sprite_idle;
}
