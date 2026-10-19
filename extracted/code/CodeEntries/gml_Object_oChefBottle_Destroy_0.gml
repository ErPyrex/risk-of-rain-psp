caster_play(61, global.volume * 0.8, 1.7);
if (instance_exists(parent))
{
    with (parent)
    {
        oHUD.alarm[0] = 4;
        fire_explosion(0, other.x, other.y, 0, 288, 2, 285, 2, 5);
        bullet.oil = 1;
    }
}
