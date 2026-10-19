activity_lizardG();
step_lizard();
step_ai_default();
if (hp <= 0)
{
    achievement_progress(26, 1);
}
if (hp < maxhp && inside_view(x, y))
{
    step_boss(0);
}
if (oTeleporter.active == 1)
{
    var t = instance_create(x, y, oEfSparks);
    t.sprite_index = sLizardGSSpawn;
    t.image_xscale = image_xscale;
    t.image_yscale = 1;
    instance_destroy();
}
