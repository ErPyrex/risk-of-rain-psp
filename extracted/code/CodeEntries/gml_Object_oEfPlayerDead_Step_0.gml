if (mouse_y >= (view_yview[0] + (view_hview[0] * 0.7) + 10) && mouse_y <= (view_yview[0] + (view_hview[0] * 0.7) + 30))
{
    choice = 1;
}
else if (mouse_y >= (view_yview[0] + (view_hview[0] * 0.7) + 48) && mouse_y <= (view_yview[0] + (view_hview[0] * 0.7) + 60))
{
    choice = 2;
}
else
{
    choice = 0;
}
