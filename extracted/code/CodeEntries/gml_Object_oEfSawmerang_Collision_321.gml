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
    if (t == 0)
    {
        id_count = min(id_count + 1, 25);
        id_list[id_count] = other.id;
        g = instance_create(x, y, oDot);
        g.parent = other.id;
        g.damage = ceil(true_damage / 5);
        g.ticks = 4;
        caster_play(63, global.volume * 0.8, 0.6 + random(0.2));
        with (instance_create(other.x, other.y, oEfBullet2))
        {
            sprite_index = sEfSlash2;
        }
        other.lastHp = other.hp;
        other.hp -= damage;
        with (instance_create(x, y, oEfDamage))
        {
            damage = other.damage;
            team = "player";
        }
        damage = ceil(max(damage - (true_damage * 0.2), true_damage * 0.1));
    }
}
