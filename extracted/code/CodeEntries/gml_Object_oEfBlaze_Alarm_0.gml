alarm[0] = 30;
ticks += 1;
if (ticks > 4)
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
