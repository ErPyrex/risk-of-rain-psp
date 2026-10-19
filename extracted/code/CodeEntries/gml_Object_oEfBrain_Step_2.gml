image_angle += 3;
if (place_meeting(x, y, pBlock) == 1)
{
    caster_play(81, global.volume, 1.3);
    move_bounce_solid(1);
    hspeed = 0;
    vspeed = sign(vspeed) * 4;
    y = yprevious;
    repeat (3)
    {
        t = random(360);
        part_type_direction(global.pBlood1, 0, 180, 0.1, 0);
        part_particles_create_color(global.above, x, y, global.pBlood1, 9751465, 8);
    }
    with (parent)
    {
        fire_explosion(2, other.x, other.y, 2, 292, 2, -1, 1.5, 2);
        bullet.team = "playerproc";
        bullet.slow_on_hit = 1;
    }
    bounces += 1;
    if (bounces > 6)
    {
        instance_destroy();
    }
}
