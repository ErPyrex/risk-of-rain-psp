step_default();
if (activity == 0 && alarm[2] == -1 && z_skill == 1 && instance_exists(target))
{
    spat = instance_create(x, y - 5, oSpitterBullet);
    spat.parent = id;
    spat.direction = point_direction(spat.x, spat.y, target.x, target.y);
    alarm[2] = skill[0, 2] * (1 - cdr);
    activity_var1 = 0;
    activity = 1;
    image_index = 0;
}
