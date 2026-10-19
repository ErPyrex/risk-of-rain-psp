oHUD.alarm[0] = 5;
if (instance_exists(parent))
{
    with (parent)
    {
        fire_explosion(2, other.x, other.y, 1, 292, 1, 528, 0.6, 1.3);
    }
    part_particles_create(global.above, x, y, global.pRubble1, global.graphics - 1);
}
