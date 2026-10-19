if (other.team == "enemy")
{
    var t = 0;
    for (i = 0; i <= id_count; i += 1)
    {
        if (id_list[i] == other.id)
        {
            t = 1;
        }
    }
    if (t == 0 && instance_exists(parent))
    {
        hit_count += 1;
        id_count = min(id_count + 1, 25);
        id_list[id_count] = other.id;
        target = other.id;
        with (parent)
        {
            fire_bullet(0, other.x - (sign(other.target.x - other.xprevious) * 9), other.y, 0, skill[1, 5], 18, 292, 90 - (90 * sign(other.x - other.xprevious)), 1, 1, -1);
            bullet.climb = other.climb;
            bullet.specific_target = other.target;
        }
        if (hit_count >= points)
        {
            instance_destroy();
        }
    }
}
