draw_self();
if (global.graphics >= 2)
{
    switch (rebound)
    {
        case 0:
            draw_set_alpha(random_range(0.1, 0.2));
            draw_line_width_colour(x, y, parent.x, parent.y - 7, 2, #7C88B8, #7C88B8);
            break;
        case 1:
            draw_set_alpha(random_range(0.1, 0.2));
            draw_line_width_colour(x, y, parent.x, parent.y - 7, 2, #7C88B8, #7C88B8);
            break;
    }
}
draw_set_alpha(1);
