if (other.team != "player" && state == 2)
{
    t = other.id;
    with (parent)
    {
        fire_bullet(0, other.t.x - 1, other.t.y - 1, 0, skill[1, 5], 3, 292, direction, 1, 1, -1);
    }
    if (global.graphics == 3)
    {
        with (instance_create(x, y, oEfBullet2))
        {
            sprite_index = sEfMissileExplosion;
            image_speed = 0.3;
        }
    }
    state = 3;
}
