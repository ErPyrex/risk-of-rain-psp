image_angle += 2;
if (place_meeting(x, y, pBlock) == 1 || place_meeting(x, y, pEnemy) == 1)
{
    instance_destroy();
    if (instance_exists(parent))
    {
        with (parent)
        {
            oHUD.alarm[0] = 4;
            fire_explosion(0, other.x, other.y, skill[1, 5], 292, 2, 83, 2, 3);
        }
    }
}
