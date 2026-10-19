if (active == 1)
{
    time = min(time + 1, maxtime);
}
if (time == maxtime && active == 1)
{
    active = 2;
    image_index = 1;
    with (parent)
    {
        opening = 1;
    }
    oHUD.alarm[0] = 10;
    caster_play(26, global.volume, 1);
    opening = 1;
    global.director.bonus_rate -= 5;
}
if (instance_exists(parent))
{
    if (parent.opening == 1 && active != 2)
    {
        active = 2;
        image_index = 1;
    }
}
