sprite_index = choose(sChest1, sChest2, sChest3, sBarrel1, sLizardIdle, sGolemIdle, sShrine1, sShrine2, sSOS, sTeleporter, sAGDG);
if (sprite_index == sShrine1 || sprite_index == sShrine2 || sprite_index == sTeleporter)
{
    image_index = sprite_get_number(sprite_index) - 1;
}
y_offset = sprite_get_yoffset(sprite_index);
image_speed = 0;
direction = 0;
