if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    if (other.attack_speed <= 2.85)
    {
        other.attack_speed += 0.15;
    }
    collide_item();
}
