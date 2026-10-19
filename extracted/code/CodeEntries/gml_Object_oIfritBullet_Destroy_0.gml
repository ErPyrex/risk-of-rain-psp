caster_play(170, global.volume, random_range(1.5, 1.7));
if (team == "enemy" && instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(2, other.x, other.y - 4, 3, -1, 2, -1, 1, 7);
    }
}
else
{
    fire_explosion(3, x, y - 4, 3, -1, 2, -1, 1, 7);
    bullet.damage = damage;
    bullet.team = "playerproc";
}
with (instance_create(x, y + 6, oEfSparks))
{
    sprite_index = sBoss1Shoot1Pillar;
    image_yscale = 1;
}
