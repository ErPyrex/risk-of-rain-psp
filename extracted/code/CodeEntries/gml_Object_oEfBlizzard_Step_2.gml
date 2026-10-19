if (global.graphics >= 2)
{
    part_particles_create(global.above, (view_xview[0] - (view_wview[0] / 2)) + random(view_wview[0] * 1.5), view_yview[0] - 5, global.pSnow, 1);
}
if (done == 0)
{
    alpha = min(0.2, alpha + 0.005);
}
else
{
    alpha = max(0, alpha - 0.005);
}
if (alpha == 0 && done == 1)
{
    instance_destroy();
}
