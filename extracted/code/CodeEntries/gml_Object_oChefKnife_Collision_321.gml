if (other.team == "enemy")
{
    var tid = other.id;
    var t = 0;
    for (i = 0; i <= id_count; i += 1)
    {
        if (id_list[i] == other.id)
        {
            t = 1;
        }
    }
    if (t == 0)
    {
        id_count = min(id_count + 1, 25);
        id_list[id_count] = other.id;
        caster_play(63, global.volume * 0.8, 0.6 + random(0.2));
        with (instance_create(other.x, other.y, oEfBullet2))
        {
            sprite_index = sEfSlash2;
        }
        with (parent)
        {
            if (other.damage == other.true_damage)
            {
                fire_explosion(0, other.x - (sign(tid.x - other.xprevious) * 9), tid.y, skill[0, 5], 292, 2, -1, 1, 1);
            }
            else
            {
                fire_explosion(2, other.x - (sign(tid.x - other.xprevious) * 9), tid.y, skill[0, 5], 292, 2, -1, 1, 1);
                bullet.team = "playerproc";
            }
            bullet.specific_target = tid;
        }
        damage = ceil(max(damage - (true_damage * 0.35), true_damage * 0.1));
    }
}
