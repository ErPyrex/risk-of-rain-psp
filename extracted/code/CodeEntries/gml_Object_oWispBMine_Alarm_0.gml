fire_explosion(3, x, y, 1, 293, 1, 548, 0.4, 5);
bullet.image_blend = image_blend;
caster_play(167, global.volume, random_range(0.9, 1.1));
if (place_meeting(x, y, oP) == 1 && team == "enemy" && (oInit.coop != 2 || global.host))
{
    with (instance_create(x, y - 12, oWisp))
    {
        sync = 1;
    }
}
if (image_blend == c_red)
{
    for (i = -1; i < 1; i += 1)
    {
        s = instance_create(x + (i * 12), (y - sprite_yoffset) + sprite_height, oFireTrail);
        s.team = "enemy";
        s.sprite_index = sEfFireTrail;
        s.alarm[1] = 60 * random_range(2, 2.5);
        s.damage = ceil(damage * 0.2);
    }
}
instance_destroy();
