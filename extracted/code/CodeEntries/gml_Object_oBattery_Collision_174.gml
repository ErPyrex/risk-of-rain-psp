if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    collide_item();
    other.hp_regen += 0.014;
}
