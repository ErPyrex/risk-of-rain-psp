if (sprite_index == sprite_turn)
{
    turning = 0;
    image_speed = 0;
    image_xscale *= -1;
    sprite_index = sprite_idle;
}
if (sprite_index == sSniperDroneShoot1)
{
    sprite_index = sprite_idle;
}
