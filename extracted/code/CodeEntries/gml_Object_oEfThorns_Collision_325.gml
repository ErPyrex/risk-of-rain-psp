if ((other.team + "proc") != team && alarm[0] == -1 && parent.activity != 30)
{
    other.lastHp = other.hp;
    other.hp -= damage;
    with (instance_create(other.x, other.y, oEfDamage))
    {
        damage = other.damage;
        team = other.team;
    }
    alarm[0] = 30;
}
