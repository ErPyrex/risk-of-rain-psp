if (beep_count > 0)
{
    beep = !beep;
    if (beep == 1)
    {
        beep_count -= 1;
        caster_play(54, global.volume, 1);
    }
    alarm[1] = 15;
}
