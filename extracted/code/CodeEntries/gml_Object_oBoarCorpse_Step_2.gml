if (image_index >= 5)
{
    pHspeed -= (sign(pHspeed) * 0.03);
    if (abs(pHspeed) <= 0.1)
    {
        pHspeed = 0;
    }
    else
    {
        oHUD.alarm[0] = 20;
        repeat (12)
        {
            part_particles_create_color(global.above, (x - sprite_xoffset) + random(sprite_width), (y - sprite_yoffset) + sprite_height, global.pPixelDust, 3418409, 1);
        }
    }
}
x += pHspeed;
if (collision_point(x + ((-sprite_get_xoffset(sprite_index) + sprite_get_width(sprite_index) + 2) * image_xscale), (y - sprite_yoffset) + sprite_height, oBossSpawn, 0, 1) < 0)
{
    pHspeed = 0;
}
