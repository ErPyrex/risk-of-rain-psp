if (active == 1 && floor(image_index) == 7)
{
    caster_play(61, global.volume, 1);
    oHUD.alarm[0] = 3;
    repeat (3)
    {
        instance_create(x, y, oBug);
    }
    achievement_progress(36, 1);
    active = 2;
}
