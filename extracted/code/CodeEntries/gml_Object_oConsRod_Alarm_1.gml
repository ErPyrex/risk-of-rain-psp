with (parent)
{
    fire_explosion(2, (other.x + other.partner.x) / 2, ((other.y + other.partner.y) / 2) - 16, skill[3, 5] + (0.2 * (scepter - 1)) + (2.5 * !other.stunned), 292, 2, -1, point_distance(other.x, other.y, other.partner.x, other.partner.y) / 39, 3);
    bullet.image_angle = point_direction(other.x, other.y, other.partner.x, other.partner.y);
    if (other.stunned == 0)
    {
        other.stunned = 1;
        caster_play(40, global.volume, 1);
        if (scepter != 0)
        {
            bullet.stun = 3;
        }
    }
}
alarm[1] = 30;
