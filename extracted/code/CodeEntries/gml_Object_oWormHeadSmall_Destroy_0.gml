for (i = 1; i <= 12; i += 1)
{
    with (body[i])
    {
        instance_destroy();
    }
}
controller.head = -1;
controller.hp = hp;
controller.wormCount -= 1;
if (dead == 1)
{
    with (controller)
    {
        instance_destroy();
    }
}
caster_stop(burn_loop);
