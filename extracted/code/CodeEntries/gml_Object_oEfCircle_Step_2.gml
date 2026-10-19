rate *= 0.7;
radius += rate;
image_alpha -= 0.05;
if (image_alpha <= 0)
{
    instance_destroy();
}
