sprite_index = choose(sGuardDeath, sLizardGDeath, sGolemDeath, sLizardDeath, sWispG2Death, sChest2, sChest1);
image_speed = 0;
image_xscale = choose(-1, 1);
image_index = sprite_get_number(sprite_index) - 1;
y += ((sprite_yoffset - sprite_height) + 16);
x += (sprite_xoffset - (sprite_width / 2));
