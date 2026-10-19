if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.missile += 1;
    collide_item();
    s = instance_create(x, y, oEfTargeting);
    s.image_blend = #5C984E;
    s.direction = 45;
    s.parent = other.id;
}
