image_alpha -= 0.02;
if (image_alpha <= 0)
{
    instance_destroy();
}
x = view_xview[0] + target_x;
y = view_yview[0] + target_y;
