if (global.time_stop == 0)
{
    with (other)
    {
        if (pVspeed != -6 && other.cd == 0 && inside_view(x, y) == 1)
        {
            caster_play(80, global.volume, 1);
            other.cd = 20;
        }
        pVspeed = -6;
    }
}
