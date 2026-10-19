if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.use_cooldown *= 0.75;
    other.alarm[0] = other.alarm[0] * 0.75;
    collide_item();
}
