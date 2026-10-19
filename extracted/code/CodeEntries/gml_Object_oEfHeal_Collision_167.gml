if (used == 0)
{
    other.maxhp_base += value;
    image_index = 0;
    used = 1;
    with (instance_create(x, y, oEfFlash))
    {
        parent = other.target;
        image_blend = c_red;
    }
    i = instance_create(x, other.y - 20, oEfDamage);
    i.critical = 0;
    i.damage = floor(value);
    i.team = "rage";
    instance_destroy();
}
