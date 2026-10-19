if (global.graphics >= 2)
{
    xx = argument0;
    yy = argument1;
    xdes = argument2;
    ydes = argument3;
    blend = argument4;
    alpha = draw_get_alpha();
    for (qq = 0; qq <= floor(point_distance(xx, yy, xdes, ydes) / 30); qq += 1)
    {
        xo = lengthdir_x(20, (point_direction(xx, yy, xdes, ydes) - 15) + random(30));
        yo = lengthdir_y(20, (point_direction(xx, yy, xdes, ydes) - 15) + random(30));
        if (global.graphics == 3)
        {
            draw_set_alpha(alpha - 0.4);
            draw_line_width_color(xx, yy, xx + xo, yy + yo, 4, blend, blend);
            draw_set_alpha(alpha);
        }
        draw_line_color(xx, yy, xx + xo, yy + yo, c_white, c_white);
        xx += xo;
        yy += yo;
    }
    if (global.graphics == 3)
    {
        draw_set_alpha(alpha - 0.4);
        draw_line_width_color(xx, yy, xdes, ydes, 4, blend, blend);
        draw_set_alpha(alpha);
    }
    draw_line_color(xx, yy, xdes, ydes, c_white, c_white);
}
