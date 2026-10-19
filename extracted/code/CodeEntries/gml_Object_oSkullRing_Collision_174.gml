if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    other.skull_ring += 1;
    other.critical_chance += 6;
    used = 1;
    collide_item();
}
