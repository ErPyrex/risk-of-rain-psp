alarm[1] = 1;
image_alpha -= 0.1;
if (image_alpha <= 0 || global.graphics == 1)
{
    instance_destroy();
}
