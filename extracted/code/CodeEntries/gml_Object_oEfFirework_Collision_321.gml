if (other.team != team && (other.team + "proc") != team && hit == 0)
{
    fire_bullet(3, other.x, other.y, 0, 1, 5, 292, direction, 1, 1, -1);
    if (global.graphics == 3)
    {
        with (instance_create(x, y, oEfBullet2))
        {
            sprite_index = sEfMissileExplosion;
            image_speed = 0.3;
        }
    }
    instance_destroy();
}
