if (other.dot_immune == 0 && other.team != team && other.invincible == 0)
{
    other.hp -= damage;
    other.dot_immune = 30;
    s = instance_create(x, y, oEfDamage);
    s.team = team;
    s.damage = string(damage);
    s = instance_create((other.x - 5) + random(10), ((other.y - 5) + random(10)) - 10, oEfBullet2);
    s.sprite_index = sBite1;
    if (other.object_index == oP)
    {
        with (other)
        {
            if (!last_hit == -1 && instance_exists(other.parent))
            {
                last_hit = other.parent.object_index;
                last_hit_name = other.parent.name;
            }
        }
    }
}
