if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.hourglass += 1;
    other.hourglass_cd = 0;
    with (other)
    {
        for (i = 0; i <= item_count; i += 1)
        {
            if (item[i, 0] == 752)
            {
                item[i, 0] = 751;
                item[i, 2] = "Falling to low health stops time.";
                break;
            }
        }
    }
    collide_item();
}
