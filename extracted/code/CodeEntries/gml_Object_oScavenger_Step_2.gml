death_timer = 60;
activity_scavenger();
step_boss(0);
if ((random(100) < 50 && hp != maxhp) || (random(100) < 10 && global.graphics >= 2))
{
    part_particles_create(global.below, x, y, global.pHeal, 1);
}
step_scavenger();
step_ai_default();
hp = min(hp + 0.06, maxhp);
