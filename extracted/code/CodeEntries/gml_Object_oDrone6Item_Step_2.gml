if (active == 1)
{
    caster_play(132, global.volume, 1);
    if (oInit.coop != 2 || global.host)
    {
        with (instance_create(x, y, oDrone6))
        {
            value = other.cost / global.enemy_buff;
        }
    }
    instance_destroy();
}
