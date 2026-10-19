if (instance_exists(parent) == 0)
{
    instance_destroy();
}
image_angle = direction;
image_yscale = (points / 10) * shrinking_co;
image_xscale = 0.5 + (points / 20);
part_particles_create(global.below, x, (y - (image_yscale * 10)) + random(20 * image_yscale), global.pCyborgBullet1, 1);
if (expanding)
{
    shrinking_co = min(shrinking_co + 0.1, 1);
    if (shrinking_co == 1 && alarm[0] == -1)
    {
        alarm[0] = 10;
    }
}
if (!expanding)
{
    shrinking_co = max(shrinking_co - 0.1, 0);
    if (shrinking_co == 0)
    {
        instance_destroy();
    }
}
