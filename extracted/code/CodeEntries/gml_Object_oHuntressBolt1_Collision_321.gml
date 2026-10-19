if (other.team != team)
{
    target = other.id;
    with (parent)
    {
        fire_bullet(0, other.x - (20 * other.image_yscale), other.y, 0, skill[0, 5], 30, 292, other.direction, 1, 1, -1);
        bullet.climb = other.climb;
        bullet.specific_target = other.target.id;
    }
    instance_destroy();
}
