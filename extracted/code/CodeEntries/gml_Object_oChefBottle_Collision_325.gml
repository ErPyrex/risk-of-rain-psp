if (other.team != "player")
{
    var ti = other.id;
    apply_buff(other.id, 31, 180);
    var te = 0;
    with (oEfOil)
    {
        if (parent == ti)
        {
            te = 1;
        }
    }
    if (!te)
    {
        with (instance_create(x, y, oEfOil))
        {
            parent = ti;
        }
    }
}
