if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(0, other.x, other.y - 4, skill[0, 5], -1, 2, -1, 1, 7);
        bullet.knockup = 5;
        bullet.stun = 0.3;
        bullet.percent_hp = 0.15;
        if (object_index == oBoss2Clone)
        {
            bullet.image_blend = c_black;
        }
    }
}
with (instance_create(x, y + 6, oEfSparks))
{
    sprite_index = sBoss1Shoot1Pillar;
    image_yscale = 1;
}
oHUD.alarm[0] = 8;
caster_play(170, global.volume, 1.5);
