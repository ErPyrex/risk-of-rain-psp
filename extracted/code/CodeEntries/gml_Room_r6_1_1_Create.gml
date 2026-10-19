global.level_name = "Risk of Rain";
global.level_subname = "UES Contact Light";
if (oInit.coop != 2 || global.host)
{
    with (oBarrel3)
    {
        save = 0;
    }
    repeat (irandom_range(1, 3))
    {
        with (instance_find(oBarrel3, irandom(instance_number(oBarrel3) - 1)))
        {
            save = 1;
        }
    }
    with (oBarrel3)
    {
        if (save == 0)
        {
            instance_destroy();
        }
    }
    with (oMedcab)
    {
        if (random(100) < 66)
        {
            instance_destroy();
        }
    }
    with (oGunchest)
    {
        if (random(100) < 66)
        {
            instance_destroy();
        }
    }
}
else
{
    with (oBarrel3)
    {
        instance_destroy();
    }
    with (oMedcab)
    {
        instance_destroy();
    }
    with (oGunchest)
    {
        instance_destroy();
    }
}
