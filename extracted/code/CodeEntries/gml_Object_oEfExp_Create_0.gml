image_speed = 0.2;
value = 1;
used = 0;
alarm[1] = 1;
if (oInit.coop != 0)
{
    target = find_target();
}
else
{
    target = 167;
}
alarm[0] = random_range(30, 60);
if (global.graphics > 1)
{
    visible = true;
}
