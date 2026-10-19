draw_self();
if (partner != -4)
{
    var tb;
    if (parent.scepter == 0)
    {
        tb = 12892302;
    }
    else
    {
        tb = 14378680;
    }
    draw_set_alpha(image_alpha * 0.8);
    draw_lightning(x, y - 23, partner.x, partner.y - 23, tb);
    draw_set_color(tb);
    draw_circle(x, y - 23, 4 - random(2), 0);
    draw_set_color(c_white);
    draw_circle(x, y - 23, 4 - random(2), 0);
    draw_set_alpha(1);
}
