if (instance_exists(parent))
{
    target = instance_nearest_variable(parent.x, parent.y, 321, "team", "enemy");
}
if (distance_to_object(target) > 600)
{
    instance_destroy();
}
