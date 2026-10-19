if (((x > view_xview[0] && x < (view_xview[0] + view_wview[0])) || ((x + (width_box * 16)) > view_xview[0] && (x + (width_box * 16)) < (view_xview[0] + view_wview[0])) || ((x + (width_box * 8)) > view_xview[0] && (x + (width_box * 8)) < (view_xview[0] + view_wview[0]))) && y >= view_yview[0])
{
    raining = 1;
}
else
{
    raining = 0;
}
alarm[0] = 5;
