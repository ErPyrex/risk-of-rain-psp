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
        if (inside_view(x, y) == 1)
        {
            oHUD.alarm[0] = 2;
        }
        id_count = min(id_count + 1, 25);
        id_list[id_count] = other.id;
        target = other.id;
        with (parent)
        {
            fire_bullet(0, other.target.x - (2 * image_xscale), other.target.y, 0, skill[1, 5] * other.damage_coeff, 4, 907, 90 - (90 * image_xscale2), 1, 1, -1);
            bullet.climb = other.climb;
            bullet.specific_target = other.target;
        }
        damage_coeff = max(0.4, damage_coeff - 0.08);
        climb += 6;
    }
}
