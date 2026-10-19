if (!skull)
{
    image_angle += 2;
    image_angle2 -= 2;
    image_alpha = min(1, image_alpha + 0.1);
    image_xscale = max(1, image_xscale - 0.03);
    image_yscale = image_xscale;
}
if (skull)
{
    image_alpha -= 0.1;
    skull_index = min(skull_index + 0.2, 9);
    if (skull_index == 5 && !attacked)
    {
        attacked = 1;
        oHUD.alarm[0] = 6;
        caster_play(28, global.volume, random_range(1, 1.5));
        with (oBoss1)
        {
            fire_explosion(0, other.x, other.y, skill[2, 5], 298, 2, 299, 1.7, 3);
            bullet.percent_hp = 0.15;
        }
        with (oBoss3)
        {
            fire_explosion(0, other.x, other.y, skill[2, 5], 298, 2, 299, 1.7, 3);
            bullet.percent_hp = 0.15;
        }
    }
    if (skull_index == 9)
    {
        skull_alpha -= 0.1;
    }
    if (skull_alpha == 0)
    {
        instance_destroy();
    }
}
