if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    if (other.purse == 0)
    {
        other.purse += 1;
    }
    else
    {
        other.purse += 0.4;
    }
    collide_item();
}
