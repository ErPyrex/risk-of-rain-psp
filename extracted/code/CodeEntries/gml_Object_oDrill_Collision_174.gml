if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.drill += 1;
    other.z_count = 0;
    collide_item();
}
