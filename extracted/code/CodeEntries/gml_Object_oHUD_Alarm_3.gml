if (oInit.coop != 1)
{
    alarm[3] = 3;
}
info_index = -1;
for (i = 0; i != 4; i += 1)
{
    if (mouse_x > (((view_xview[0] + (view_wview[0] * 0.5)) - 46) + (23 * i)) && mouse_x < (((view_xview[0] + (view_wview[0] * 0.5)) - 28) + (23 * i)) && mouse_y > ((view_yview[0] + view_hview[0]) - 64) && mouse_y < ((view_yview[0] + view_hview[0]) - 46))
    {
        info_index = i;
    }
}
