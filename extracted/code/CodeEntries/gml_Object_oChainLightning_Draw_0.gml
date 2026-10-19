draw_set_color(c_white);
draw_set_alpha(image_alpha);
count = 0;
for (t = 0; t < bounce; t += 1)
{
    draw_lightning(target[t, 1], target[t, 2], target[t + 1, 1], target[t + 1, 2], blend);
    if (global.graphics >= 2)
    {
        draw_circle(target[t + 1, 1], target[t + 1, 2], 4 - random(2), 0);
        draw_circle(target[t, 1], target[t, 2], 4 - random(2), 0);
    }
}
draw_lightning(x, y, target[0, 1], target[0, 2], blend);
draw_circle(x, y, 4 - random(2), 0);
draw_set_alpha(1);
