skip = !skip;
if (!skip || !global.frame_skip)
{
    draw_enable_drawevent(1);
}
else
{
    draw_enable_drawevent(0);
}
if (global.pause)
{
    image_speed = 0;
}
else
{
    image_speed = 1;
}
