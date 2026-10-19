if (argument0 < (view_xview[0] - 600) || argument0 > (view_xview[0] + view_wview[0] + 600) || argument1 < (view_yview[0] - 600) || argument1 > (view_yview[0] + view_hview[0] + 600))
{
    return 0;
}
else
{
    return 1;
}
