if (active == 1)
{
    global.music_name = 18;
    global.director.alarm[1] = -1;
    active = 2;
    image_speed = 0.2;
    oHUD.alarm[0] = 1;
    alarm[0] = 30;
    with (pEnemy)
    {
        instance_destroy();
    }
    with (oDancingGolem)
    {
        instance_destroy();
    }
    with (instance_create(4336, 1120, oBNoSpawn))
    {
        height_box = 15;
        image_yscale = 15;
        alarm[0] = -1;
        for (i = 0; i < 15; i++)
        {
            CreateCollision(x, y + (i * 16), 1);
        }
    }
    with (oP)
    {
        if (x <= 4366)
        {
            x = 4800;
            y = 1279;
        }
    }
    oHUD.boss = -1;
    with (137482)
    {
        offset = 0;
    }
    with (137483)
    {
        offset = 0;
    }
}
if (active == 2)
{
    if (alarm[1] != -1)
    {
        oHUD.alarm[0] = 1;
    }
}
