image_speed += 0.002;
if (!place_meeting(x, y + 1, pBlock))
{
    move_contact_solid(270, vsp);
    vsp += 0.1;
}
