if (!dont_delete)
{
    for (i = 0; i < width_box; i++)
    {
        for (s = 0; s < height_box; s++)
        {
            set_collision(x + (i * 16), y + (s * 16), 0);
        }
    }
}
