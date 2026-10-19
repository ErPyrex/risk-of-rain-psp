part_type_size(global.pDiagFire, 0.6, 1, 0, 0);
repeat (10)
{
    part_particles_create(global.middle, x - random(226), y, global.pDiagFire, 1);
}
oCutsceneControl.shakex = 3;
oCutsceneControl.shakey = 3;
