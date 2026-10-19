if (instance_exists(target))
{
    if (global.graphics >= 2)
    {
        draw_set_alpha(0.2 + random(0.3));
        draw_line_width_color(x, y, target.x, target.y, 4, #5CED58, #5CED58);
        draw_circle_color(x, y, 4 + random(0.1), #5CED58, #5CED58, 0);
        draw_circle_color(target.x, target.y, 4 + random(0.1), #5CED58, #5CED58, 0);
    }
    draw_set_alpha(1);
    draw_line_width_color(x, y, target.x, target.y, 2.5, c_white, c_white);
}
