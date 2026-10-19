if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    collide_item();
    if (instance_exists(oEfPoison) == 0)
    {
        s = instance_create(x, y, oEfPoison);
        s.parent = other.id;
        s.team = other.team + "proc";
        s.coeff = 1;
    }
    else
    {
        oEfPoison.coeff += 0.5;
    }
}
