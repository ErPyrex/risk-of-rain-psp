alarm[0] = 30;
if (instance_exists(target))
{
    with (parent)
    {
        fire_explosion(2, (other.x + other.target.x) / 2, (other.y + other.target.y) / 2, other.coeff, 292, 2, -1, point_distance(other.x, other.y, other.target.x, other.target.y) / 39, 1);
        bullet.image_angle = point_direction(other.x, other.y, other.target.x, other.target.y);
        bullet.plasma = 0;
        bullet.team = "playerproc";
    }
}
