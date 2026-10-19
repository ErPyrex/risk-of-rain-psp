oHUD.alarm[0] = 1;
if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.xx, other.yy, 1, 292, 2, 501, 1.5, 3);
        bullet.climb = 8;
        bullet.image_yscale = 1;
        caster_play(170, global.volume, 3);
    }
}
instance_destroy();
