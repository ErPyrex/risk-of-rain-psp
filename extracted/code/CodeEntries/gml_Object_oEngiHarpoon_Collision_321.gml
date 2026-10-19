if (other.team != team && (other.team + "proc") != team && hit == 0 && alarm[2] == -1)
{
    paul = other.id;
    if (instance_exists(parent))
    {
        with (parent)
        {
            fire_bullet(0, other.paul.x, other.paul.y, 0, skill[2, 5], 5, 292, direction, 1, 1, -1);
        }
    }
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
