if (argument0 < (view_xview[0] - 8) || argument0 > (view_xview[0] + view_wview[0] + 8) || argument1 < (view_yview[0] - 8) || argument1 > (view_yview[0] + view_hview[0] + 8))
{
    return 0;
}
else
{
    return 1;
}
