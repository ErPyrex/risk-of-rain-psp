for (i = 1; i <= 19; i += 1)
{
    with (body[i])
    {
        instance_destroy();
    }
}
if (instance_exists(controller))
{
    controller.head = -10;
    controller.hp = hp;
    if (dead == 1)
    {
        with (controller)
        {
            instance_destroy();
        }
    }
}
audio_stop_sound(wWormBurning);
