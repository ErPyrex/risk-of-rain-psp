if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    var tp_id = other.id;
    var tused = 0;
    collide_item();
    with (oEfThorns)
    {
        if (parent == tp_id)
        {
            coeff += 0.2;
            tused = 1;
        }
    }
    if (!tused)
    {
        s = instance_create(x, y, oEfThorns);
        s.parent = other.id;
        s.team = other.team + "proc";
        s.coeff = 1;
    }
}
