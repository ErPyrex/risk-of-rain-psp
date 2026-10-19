if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    collide_item();
    if (other.critical_chance == 1)
    {
        other.critical_chance += 10;
    }
    else
    {
        other.critical_chance += 7;
    }
}
