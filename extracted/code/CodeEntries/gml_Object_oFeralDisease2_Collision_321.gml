if (other.team == "enemy" && alarm[0] == -1)
{
    if ((other.id == target || target == -50) && instance_exists(parent))
    {
        hit_count += 1;
        if (target == -50)
        {
            master.id_count = min(master.id_count + 1, 40);
            master.id_list[master.id_count] = other.id;
            target = other.id;
        }
        with (parent)
        {
            fire_bullet(0, other.target.x - (3 * sign(other.x - other.xprevious)), other.target.y, 0, skill[3, 5], 9, 292, 90 - (90 * sign(other.xprevious - other.x)), 1, 1, -1);
            bullet.climb = other.climb;
            bullet.specific_target = other.target;
        }
        with (instance_create(x, y, oDot2))
        {
            sprite_index = sEfPoison5;
            master = other.master;
            parent = other.target;
            true_parent = other.parent;
            damage = other.parent.skill[3, 5] * other.parent.damage;
            ticks = 5;
            textColor = 5108425;
        }
        instance_destroy();
    }
}
