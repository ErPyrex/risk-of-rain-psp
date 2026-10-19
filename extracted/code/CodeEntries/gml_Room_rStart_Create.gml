with (pFriend)
{
    instance_destroy();
}
with (oHUD)
{
    instance_destroy();
}
with (oDirectorControl)
{
    instance_destroy();
}
global.level_name = "";
global.level_subname = "";
view_yview[0] = room_height - view_hview[0];
background_x[1] = (view_xview[0] + (view_wview[0] / 2)) - 200;
background_y[1] = view_yview[0] + 16;
