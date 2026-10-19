if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    other.explosive_shot += 1;
    used = 1;
    collide_item();
}
