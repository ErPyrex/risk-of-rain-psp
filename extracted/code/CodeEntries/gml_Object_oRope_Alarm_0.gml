s = -1;
for (i = 1; i != 64; i += 1)
{
    s = collision_point(x, y + (16 * i) + 3, oRope, 0, 1);
    if (s > 0)
    {
        height_box += s.height_box;
        image_yscale = height_box;
        with (s)
        {
            instance_destroy();
        }
    }
    else
    {
        break;
    }
}
