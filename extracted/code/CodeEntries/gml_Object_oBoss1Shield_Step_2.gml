image_alpha -= rate;
yoff -= 0.05;
if (instance_exists(oBoss1))
{
    x = oBoss1.x;
    y = (oBoss1.y - 32) + yoff;
}
if (image_alpha <= 0)
{
    instance_destroy();
}
