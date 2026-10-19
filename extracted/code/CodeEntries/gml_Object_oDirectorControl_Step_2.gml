oInit.player_max_chosen = instance_number(oP);
instance_activate_region(view_xview[0] - 200, view_yview[0] - 200, view_wview[0] + 400, view_hview[0] + 400, true);
global.time_stop = max(0, global.time_stop - 1);
if (global.time_stop != 0 && global.graphics == 3)
{
    with (oP)
    {
        var gg = instance_create(x, y, oEfTrail);
        gg.sprite_index = sprite_index;
        gg.image_index = image_index;
        gg.image_xscale = image_xscale;
    }
}
if (global.time_stop == 0 && alarm[0] == -1)
{
    alarm[0] = 60;
}
