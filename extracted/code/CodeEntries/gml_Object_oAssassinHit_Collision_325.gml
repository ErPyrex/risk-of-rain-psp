if (hit == 0 && other.team != team)
{
    hit = 1;
    other.hp -= damage;
    other.lasthit_x = x;
    s = instance_create(x, y, oEfDamage);
    s.team = team;
    s.damage = string(damage);
    s.critical = critical;
    s = instance_create((other.x - 5) + random(10), ((other.y - 5) + random(10)) - 10, oEfBullet2);
    s.sprite_index = sBite1;
    if (instance_exists(parent))
    {
        parent.hit = 2;
    }
}
