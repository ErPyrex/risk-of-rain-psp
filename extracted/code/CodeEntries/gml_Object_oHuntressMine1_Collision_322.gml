if (active == 1 && instance_exists(parent))
{
    t = instance_create(other.x, y, oEfSparks);
    t.parent = other.id;
    t.image_yscale = 1;
    t.sprite_index = sHuntressMine1Explosion;
    t.image_speed = 0.25;
    with (parent)
    {
        fire_explosion(0, other.x, other.y, skill[2, 5], 292, 2, -1, 1, 3);
        bullet.snare = 3;
    }
    instance_destroy();
}
