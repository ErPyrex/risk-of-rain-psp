s = -1;
for (i = 1; i != 64; i += 1)
{
    s = collision_point(x + (i * 16), y + 1, oB, 0, 1);
    if (s > 0)
    {
        if (s.height_box == 1)
        {
            width_box += s.width_box;
            image_xscale = width_box;
            with (s)
            {
                dont_delete = 1;
                instance_destroy();
            }
        }
    }
    else
    {
        break;
    }
}
if (width_box == 1)
{
    for (i = 1; i != 64; i += 1)
    {
        s = collision_point(x, y + (i * 16), oB, 0, 1);
        if (s > 0)
        {
            if (s.width_box == 1)
            {
                height_box += s.height_box;
                image_yscale = height_box;
                with (s)
                {
                    dont_delete = 1;
                    instance_destroy();
                }
            }
            else
            {
                break;
            }
        }
        else
        {
            break;
        }
    }
}
