if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.critical_chance += 5;
    other.wolfblood += 1;
    collide_item();
}
