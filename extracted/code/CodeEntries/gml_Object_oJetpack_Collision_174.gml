if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.pVmax = min(other.pVmax + 0.2, 6);
    other.pGravity2 = max(other.pGravity2 - 0.05, 0.1);
    collide_item();
}
