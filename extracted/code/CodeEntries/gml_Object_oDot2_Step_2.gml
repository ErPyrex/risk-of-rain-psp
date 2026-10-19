if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y;
}
else if (alarm[1] == -1)
{
    if (sprite_index == sEfPoison5 || sprite_index == sEfPoison6)
    {
        with (instance_create(x, y, oEfHeal2))
        {
            image_speed = 0.2;
            value = other.true_parent.maxhp * 0.02;
            target = other.true_parent;
            used = 0;
            alarm[0] = random_range(30, 60);
            direction = 45 + (choose(1, 0) * 90);
            speed = 1;
        }
    }
    instance_destroy();
}
