image_angle += speed;
if (get_collision(x, y))
{
    speed = 0;
    x = xprevious;
    y = yprevious;
}
