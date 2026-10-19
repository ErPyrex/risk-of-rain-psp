instance_activate_region(x - 800, y - 600, x + 1000, y + 1000, true);
if (post_game == 1)
{
    oHUD.alarm[0] = -1;
    white_glow = max(white_glow - 0.1, 0);
}
if (rest == 0)
{
    if (collision_rectangle(x - 10, y - 10, x + 10, y + 10 + vspeed, pBlock, 1, 1) > 0 && place_meeting(x, y + 1 + vspeed, pBlock) == 1)
    {
        rest = 1;
        image_index = 1;
        image_speed = 0.2;
        move_contact_solid(270, -1);
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
        alarm[0] = 120;
    }
    else
    {
        move_bounce_solid(0);
        if ((other.x - x) > 1)
        {
            image_xscale = 1;
        }
        else
        {
            image_xscale = -1;
        }
    }
}
if (following == 1)
{
    if (instance_exists(oInit.player[1, 2].following_player) == 0 || oInit.player[1, 2].moveUp == 1)
    {
        oInit.player[1, 2].following_player_index += 1;
    }
    if (oInit.player[1, 2].following_player_index > instance_number(oP))
    {
        oInit.player[1, 2].following_player_index = 2;
    }
    oInit.player[1, 2].following_player = oInit.player[oInit.player[1, 2].following_player_index, 2];
}
