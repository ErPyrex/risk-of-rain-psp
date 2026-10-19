if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.scythe += 1;
    other.critical_chance += 5;
    collide_item();
}
