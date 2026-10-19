if (global.time_stop == 0)
{
    image_yscale += rate;
}
if (image_yscale >= max_height && sign(rate) == 1)
{
    rate = -0.05;
}
if (image_yscale <= 0)
{
    instance_destroy();
}
