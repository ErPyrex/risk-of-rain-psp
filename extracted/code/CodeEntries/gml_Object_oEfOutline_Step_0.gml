image_alpha -= rate;
if (image_alpha <= 0 || global.graphics == 1)
{
    instance_destroy();
}
