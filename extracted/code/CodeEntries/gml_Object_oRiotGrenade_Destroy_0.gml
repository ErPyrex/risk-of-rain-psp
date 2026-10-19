if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[3, 5] + (0.2 * (scepter - 1)), 292, 1, 209, 3.5, 9);
        if (scepter != 0)
        {
            bullet.fear = 1;
            bullet.knockback += 8;
        }
        else
        {
            bullet.stun = 1;
        }
        oHUD.alarm[0] = 5;
    }
}
caster_play(140, global.volume, 1);
