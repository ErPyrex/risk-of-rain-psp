if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.stun = 1 - ((1 - other.stun) * 0.94);
    collide_item();
}
