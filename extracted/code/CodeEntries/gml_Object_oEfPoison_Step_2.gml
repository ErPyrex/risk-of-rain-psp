if (instance_exists(parent) == 0)
{
    if (damaging == 0)
    {
        instance_destroy();
    }
    if (damaging == 1)
    {
        if (distance_to_object(instance_nearest_variable(x, y, 321, "team", "enemy")) <= 30)
        {
            parent = instance_nearest_variable(x, y, 321, "team", "enemy");
            alarm[1] = 360;
        }
        else
        {
            instance_destroy();
        }
    }
}
else if (parent.hp <= 0)
{
    instance_destroy();
}
else
{
    x = parent.x;
    y = parent.y;
    if (damaging == 1 && alarm[0] == -1)
    {
        parent.lastHp = parent.hp;
        parent.hp -= damage;
        with (instance_create(parent.x, parent.y, oEfDamage))
        {
            damage = other.damage;
            team = other.team;
        }
        alarm[0] = 30;
    }
    if (damaging == 0)
    {
        if (instance_number(oEfPoison) == 1)
        {
            alarm[0] = -1;
        }
        damage = ceil(oP.damage * 0.5);
    }
}
