if (instance_exists(parent))
{
    if ((other.team + "proc") != team && parent.activity != 30 && hit != 2 && random(100) < 50)
    {
        hit = 1;
        other.lastHp = other.hp;
        other.hp -= damage;
        with (instance_create(other.x, other.y, oEfDamage))
        {
            damage = other.damage;
            team = other.team;
        }
        alarm[1] = 30;
    }
}
