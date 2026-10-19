if (!place_meeting(x, y + 1, pBlock) && !set)
{
    move_contact_solid(270, vsp);
    vsp += 0.1;
    if (get_collision(x, y + 1) > 0)
    {
        set = 1;
    }
}
if (floor(image_index) == 6 && fired == 0 && active == 2)
{
    oHUD.alarm[0] = 5;
    caster_play(147, global.volume, 1.5);
    fired = 1;
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[1, 5], 292, 2, -1, 1.2, 1);
    }
}
