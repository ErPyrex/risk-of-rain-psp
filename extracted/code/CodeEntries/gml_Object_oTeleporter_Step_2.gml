if (active == 1)
{
    with (oShrine2)
    {
        if (charges > 0)
        {
            image_index = 0;
            image_speed = 0.2;
            active = 2;
            charges = -1;
            sprite_index = sShrine2Death;
            if (inside_view(x, y))
            {
                caster_play(170, global.volume, 1.2);
            }
        }
    }
    with (oShrine5)
    {
        if (charges > 0)
        {
            image_index = 0;
            image_speed = 0.2;
            active = 2;
            charges = -1;
            sprite_index = sShrine2Death;
            if (inside_view(x, y))
            {
                caster_play(170, global.volume, 1.2);
            }
        }
    }
    time = min(time + 1, maxtime);
    if (time == maxtime && instance_number(pEnemy) == 0)
    {
        achievement_progress(12, 1);
    }
    with (oP)
    {
        if (((oInit.coop == 2 && global.my_player) || oInit.coop != 2) && last_hit_number == 0 && class == 1 && oInit.current_level == 3)
        {
            achievement_progress(13, 1);
        }
    }
}
if (time == maxtime && active < 3)
{
    with (oP)
    {
        last_hit_time = 0;
    }
    image_index = 1;
    active = 2;
    global.director.alarm[1] = -1;
    if (((instance_number(pEnemy) - global.director.ghost_count) + global.director.deactivated_count) <= 0)
    {
        active = 3;
        if (oInit.current_level == 3 && oInit.achievement[6, 0] == 0)
        {
            with (instance_create(x, y, oPod))
            {
                achievement_number = 6;
            }
        }
    }
}
