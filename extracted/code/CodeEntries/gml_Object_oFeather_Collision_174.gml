if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.feather = max(2, other.feather + 1);
    collide_item();
}
