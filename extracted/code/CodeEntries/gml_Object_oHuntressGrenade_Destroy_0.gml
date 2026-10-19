move_contact_solid(270, 5);
if (instance_exists(parent))
{
    with (parent)
    {
        if (scepter == 0)
        {
            fire_explosion(2, other.x, other.y + 2, 0.8, 292, 2, 153, 0.8, 1.3);
        }
        else
        {
            fire_explosion(2, other.x, other.y + 2, 0.8 + (0.05 * (scepter - 1)), 292, 2, 154, 0.8, 1.3);
        }
        bullet.team = "playerproc";
    }
}
caster_play(76, global.volume, random_range(1.3, 1.45));
