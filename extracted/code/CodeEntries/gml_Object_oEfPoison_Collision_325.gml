if (damaging == 0)
{
    if ((other.team + "proc") != team && alarm[0] == -1 && parent.activity != 30)
    {
        s = instance_create(x, y, oEfPoison);
        s.parent = other.id;
        s.damage = damage;
        s.damaging = 1;
        s.alarm[1] = 360;
        s.team = team;
        alarm[0] = 360 / coeff;
    }
}
