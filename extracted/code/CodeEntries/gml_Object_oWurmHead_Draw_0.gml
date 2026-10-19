if (type == 1)
{
    if (shooting == 1)
    {
        draw_set_color(c_white);
        draw_set_alpha(0.8);
        draw_circle(drawx, drawy, 15 * (alarm[2] / cooldown), 1);
        draw_line(drawx + lengthdir_x(30, 360 * (alarm[2] / cooldown)), drawy + lengthdir_y(30, 360 * (alarm[2] / cooldown)), drawx + lengthdir_x(-30, 360 * (alarm[2] / cooldown)), drawy + lengthdir_y(-30, 360 * (alarm[2] / cooldown)));
        draw_line(drawx + lengthdir_x(30, (360 * (alarm[2] / cooldown)) + 90), drawy + lengthdir_y(30, (360 * (alarm[2] / cooldown)) + 90), drawx + lengthdir_x(-30, (360 * (alarm[2] / cooldown)) + 90), drawy + lengthdir_y(-30, (360 * (alarm[2] / cooldown)) + 90));
    }
    if (shooting == 2)
    {
        draw_set_alpha(0.4);
        draw_set_color(c_red);
        draw_line_width(x + lengthdir_x(25, direction), y + lengthdir_y(25, direction), drawx, drawy, 13);
        draw_circle(drawx, drawy, 4 + random(6), 0);
        draw_set_color(c_white);
        draw_line_width(x + lengthdir_x(25, direction), y + lengthdir_y(25, direction), drawx, drawy, 7);
        draw_circle(drawx, drawy, 4, 1);
        draw_set_alpha(0.5);
        repeat (3)
        {
            draw_lightning(x + lengthdir_x(25, direction), y + lengthdir_y(25, direction), drawx, drawy, 255);
        }
    }
}
for (i = 1; i <= body_count; i += 1)
{
    with (body[body_count - i])
    {
        draw_self();
    }
}
