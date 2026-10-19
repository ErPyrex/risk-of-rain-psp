pHspeed = 2.5 * image_xscale;
if (global.time_stop == 0)
{
    image_speed = 0.2;
    x += pHspeed;
    part_type_direction(global.pLava, 90 - (60 * -image_xscale), 90 - (60 * -image_xscale), 0, 0.1);
    part_particles_create(global.above, (x - sprite_xoffset) + random(sprite_width), ((y - sprite_yoffset) + sprite_height) - 10, global.pLava, 1);
}
else
{
    image_speed = 0;
}
if (x > ((lava_parent.x + min(1228, lava_parent.width_b * 16)) - 100) || x < (lava_parent.x + 40))
{
    pHspeed *= -1;
    image_xscale = -image_xscale;
}
if (lastHp > hp)
{
    caster_play(51, global.volume, 2);
    lastHp = hp;
}
step_boss(0);
if (image_speed2 != 0)
{
    image_index2 += image_speed2;
    if (image_index2 > (sprite_get_number(sprite_index2) - 1))
    {
        image_index2 = 0;
        image_speed2 = 0;
    }
}
if ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death)
{
    instance_destroy();
}
