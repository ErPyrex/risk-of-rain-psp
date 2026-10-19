part_particles_create(global.above, x, y + 6, global.pRubble2, 1);
instance_activate_region(x - 16, y - 16, 32, 300, true);
move_contact_solid(270, -1);
if (!place_meeting(x, y, oMinerDust))
{
    oHUD.alarm[0] = 1;
    var tdust = instance_create(x, y, oMinerDust);
    tdust.image_xscale = image_xscale;
    tdust.sprite_index = sBoss1Shoot1Dust;
    if (instance_exists(parent))
    {
        if (parent.object_index == oBoss2Clone)
        {
            tdust.image_blend = c_black;
        }
    }
}
