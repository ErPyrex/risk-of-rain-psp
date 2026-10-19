image_speed = 0;
image_index = sprite_get_number(sprite_index) - 1;
if (charges == 0)
{
    image_index = 6;
    image_speed = 0;
    charges = -1;
}
else if (charges != -1)
{
    alarm[1] = 60;
}
