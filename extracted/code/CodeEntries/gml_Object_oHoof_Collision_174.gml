if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.pHmax = min(other.pHmax + 0.15, 5);
    collide_item();
}
