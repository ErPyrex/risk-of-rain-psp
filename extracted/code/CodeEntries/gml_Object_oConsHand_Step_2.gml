part_particles_create(global.middle, x, y, global.pSpark, 1);
image_angle = direction;
if (!instance_exists(parent))
{
    instance_destroy();
}
if (!done)
{
    x += dx;
    if (get_collision(x, y) > 0 || get_collision(x, y - 8) > 0 || get_collision(x, y + 8) > 0)
    {
        done = 1;
        target = -4;
        caster_play(100, global.volume, 2);
        with (parent)
        {
            fire_explosion(0, other.x, other.y, skill[2, 5], 296, 2, -1, 1, 2);
            bullet.max_hit_number = 1;
            bullet.stun = 3;
        }
    }
    else
    {
        var ti = instance_place(x, y, pEnemy);
        if (ti == -4)
        {
            ti = instance_place((x + xprevious) / 2, (y + yprevious) / 2, pEnemy);
        }
        if (ti == -4)
        {
            ti = instance_place(x, y, oConsRod);
        }
        if (ti != -4)
        {
            caster_play(100, global.volume, 2);
            done = 1;
            target = ti;
            xo = target.x - x;
            yo = target.y - y;
            with (parent)
            {
                fire_explosion(0, other.x, other.y, skill[2, 5], 296, 2, -1, 1, 2);
                bullet.stun = 3;
                bullet.max_hit_number = 1;
            }
        }
    }
}
else if (instance_exists(target))
{
    x = target.x - xo;
    y = target.y - yo;
}
