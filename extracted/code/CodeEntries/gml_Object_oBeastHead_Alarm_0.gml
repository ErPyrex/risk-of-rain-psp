if (head == 1)
{
    if (true_parent.chase == 1 && image_speed == 0)
    {
        sprite_index = sBeastHeadShoot1;
        image_index = 0;
        image_speed = 0.2;
    }
    alarm[0] = 20 * random_range(1, 3);
}
