part_particles_create(global.below, x, y, global.pSmoke2, 1);
image_angle = turn_towards(image_angle, 225);
direction = image_angle;
if (alarm[0] != -1)
{
    view_xview[0] += -1 + random(2);
    view_yview[0] += -1 + random(2);
}
