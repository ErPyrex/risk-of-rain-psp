if (charges > 0)
{
    with (instance_create(x, y, oHuntressCape))
    {
        parent = other.id;
        true_parent = other.true_parent;
        charges = other.charges - 1;
    }
}
