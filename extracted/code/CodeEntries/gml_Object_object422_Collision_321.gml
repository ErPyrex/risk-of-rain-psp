if (active == 1 && instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[2, 5], 292, 2, 153, 1, 3);
        bullet.knockback = 1;
    }
    oHUD.alarm[0] = 5;
    instance_destroy();
}
