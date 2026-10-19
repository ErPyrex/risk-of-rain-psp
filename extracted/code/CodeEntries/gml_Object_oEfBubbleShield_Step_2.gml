if (instance_exists(parent) == 0)
{
    instance_destroy();
}
else
{
    if (alarm[0] != -1)
    {
        image_alpha = min(1, image_alpha + 0.2);
    }
    else
    {
        image_alpha = max(0, image_alpha - 0.2);
    }
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
    else
    {
        x = round(parent.x);
        y = round(parent.y);
        parent.invincible = 10005;
    }
}
