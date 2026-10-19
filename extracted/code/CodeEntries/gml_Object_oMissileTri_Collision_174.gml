if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.missile_tri += 1;
    collide_item();
    s = instance_create(x, y, oEfTargeting);
    s.image_blend = c_orange;
    s.direction = 0;
    s.parent = other.id;
}
