npc_death(1, force_death);
boss_death();
oHUD.alarm[0] = 30;
caster_play(169, global.volume, 0.5);
part_type_direction(global.pLava, 0, 180, 0, 0.1);
repeat (23)
{
    part_particles_create(global.above, (x - sprite_xoffset) + random(sprite_width), ((y - sprite_yoffset) + sprite_height) - 10, global.pLava, 1);
}
with (instance_create(x, y, oTurtleCorpse))
{
    lava_parent = other.lava_parent;
    image_xscale = other.image_xscale;
    pHspeed = other.pHspeed;
}
y += 20;
if (global.director.boss_drop == 0)
{
    global.director.boss_drop = 1;
    drop_item(2);
}
else
{
    drop_item(1);
}
y -= 20;
