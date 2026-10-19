if (instance_exists(oP))
{
    if (heat != 0 && oP.dead == 0)
    {
        draw_self();
        draw_set_color(c_black);
        draw_rectangle(x + 13, y, (x + 13) - (26 * (1 - (heat / 100))), y + 2, false);
    }
}
