if (instance_exists(parent))
{
    alarm[0] = 30;
    s = instance_create(x, y, oEfFlash);
    s.parent = parent;
    s.image_blend = c_lime;
    ticks += 1;
    if (ticks > ticks_max)
    {
        instance_destroy();
    }
    parent.lastHp = parent.hp;
    parent.hp -= damage;
    with (instance_create(parent.x, parent.y, oEfDamage))
    {
        damage = ceil(other.damage);
        team = other.team;
    }
    alarm[0] = 30;
}
