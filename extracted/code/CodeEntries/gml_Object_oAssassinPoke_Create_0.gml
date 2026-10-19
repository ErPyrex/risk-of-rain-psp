event_inherited();
image_speed = 0;
alarm[0] = 90;
image_xscale = sign(oP.x - x);
init_default();
hit = 0;
team = "enemy";
image_alpha = 0;
repeat (19)
{
    part_particles_create(global.above, (x - 30) + random(60), (y - 30) + random(60), global.pAssassin, 1);
}
actual_hp = 8;
