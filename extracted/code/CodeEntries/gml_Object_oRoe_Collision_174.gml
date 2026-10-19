if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    var tp_id = other.id;
    used = 1;
    with (instance_create(other.x, other.y - 1, oSucker))
    {
        master = tp_id;
    }
    collide_item();
}
