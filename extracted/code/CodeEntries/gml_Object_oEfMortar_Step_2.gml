ff += 0.1;
image_angle = direction;
if (global.graphics == 3)
{
    part_particles_create(global.above, x + lengthdir_x(7 * sin(ff), direction - 90), y + lengthdir_y(7 * sin(ff), direction - 90), global.pMortar, 1);
}
if (global.graphics >= 2)
{
    part_particles_create(global.above, x - lengthdir_x(7 * sin(ff), direction - 90), y - lengthdir_y(7 * sin(ff), direction - 90), global.pMortar, 1);
}
if (place_meeting(x, y, pBlock) == 1)
{
    caster_play(123, global.volume * 2, 0.8);
    fire_explosion(3, x, y, 1, 292, 2, 883, 1.3, 1);
    oHUD.alarm[0] = 5;
    instance_destroy();
}
