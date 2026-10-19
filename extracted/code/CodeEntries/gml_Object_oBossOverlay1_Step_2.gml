if (!reverse_alpha)
{
    image_alpha = min(1, image_alpha + 0.05);
    ring_alpha = min(1, ring_alpha + 0.05);
}
else
{
    image_alpha -= 0.05;
    ring_alpha -= 0.05;
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}
x += (0.2 * sign(image_xscale));
image_xscale = max(1, abs(image_xscale) - 0.02) * sign(image_xscale);
image_yscale = image_xscale;
position_1 += 0.3;
position_2 += 0.4;
position_3 += 0.5;
