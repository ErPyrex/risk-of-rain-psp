if (instance_exists(parent))
{
    x = parent.x;
    y = parent.y;
    image_xscale = parent.image_xscale;
}
else
{
    instance_destroy();
}
