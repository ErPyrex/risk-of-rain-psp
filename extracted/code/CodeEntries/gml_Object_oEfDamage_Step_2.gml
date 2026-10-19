image_alpha = max(0, image_alpha - 0.05);
if (image_alpha <= 0 || (image_alpha <= 2 && global.graphics == 1))
{
    instance_destroy();
}
