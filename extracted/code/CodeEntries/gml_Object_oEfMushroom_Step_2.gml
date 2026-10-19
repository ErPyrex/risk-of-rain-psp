if (instance_exists(parent) == 1)
{
    if (parent.x != parent.xprevious || parent.y != parent.yprevious || parent.activity != 0)
    {
        dead = 1;
    }
}
else
{
    dead = 1;
}
if (dead == 1)
{
    image_alpha -= 0.1;
}
if (image_alpha <= 0)
{
    instance_destroy();
}
