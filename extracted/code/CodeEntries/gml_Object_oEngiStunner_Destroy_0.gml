if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[2, 5], 292, 2, -1, 3, 3);
        bullet.explosive_shot = 1;
        bullet.knockback += 9;
        bullet.stun = 1;
    }
}
