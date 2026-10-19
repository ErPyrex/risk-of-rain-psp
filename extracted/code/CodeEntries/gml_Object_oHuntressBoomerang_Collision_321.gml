if (other.team == "enemy" && alarm[0] == -1)
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
            fire_bullet(0, other.x - (sign(other.target.x - other.xprevious) * 9), other.y, 0, skill[1, 5] + other.damage_coeff, 18, 292, 90 - (90 * sign(other.x - other.xprevious)), 1, 1, -1);
            bullet.climb = other.climb;
            bullet.specific_target = other.target;
        }
        damage_coeff += 0.3;
        if (random(100) < 100)
        {
            for (i = 0; i <= id_count; i += 1)
            {
                instance_deactivate_object(id_list[i]);
            }
            target = instance_nearest_variable(x, y, 321, "team", "enemy");
            speed += 1;
            yoff = random_range(-4, 4);
            if (distance_to_object(target) > 200 || target == -5)
            {
                target = -5;
            }
            else
            {
                direction += random_range(-20, 20);
            }
            caster_play(137, global.volume * 0.7, random_range(0.8, 0.9));
            alarm[0] = 1;
            instance_activate_all();
        }
        else
        {
            instance_destroy();
        }
    }
}
