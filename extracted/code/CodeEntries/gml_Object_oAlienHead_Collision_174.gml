if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.cdr = min(1 - ((1 - other.cdr) * 0.7), 0.6);
    collide_item();
}
