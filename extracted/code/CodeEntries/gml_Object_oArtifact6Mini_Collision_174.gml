if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.use_cooldown = 1 - ((1 - other.use_cooldown) * 0.95);
    collide_item();
}
