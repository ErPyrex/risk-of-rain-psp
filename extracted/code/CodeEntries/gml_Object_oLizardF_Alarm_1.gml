if (landing == 0)
{
    intended_speed = 3;
    if (oInit.coop != 2)
    {
        alarm[2] = 60 * random_range(0.4, 1);
    }
    else
    {
        alarm[2] = 42;
    }
    sprite_index = sLizardFShoot1;
    image_speed = 0.4;
    alarm[0] = 1;
}
