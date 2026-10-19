sprite_index = sLightning;
image_index = 0;
oHUD.alarm[0] = 2;
s = instance_create(x, y, oExplosion1);
s.image_xscale = 0.5;
s.image_yscale = 2;
s.team = team;
s.weather = 1;
damage_default(s, 1);
sound_play(wLightning);
repeat (2)
{
    part_particles_create(global.below, x, y, global.pSpark, 1);
}
