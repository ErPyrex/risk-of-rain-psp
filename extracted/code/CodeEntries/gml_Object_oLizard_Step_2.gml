activity_lizard();
step_lizard();
step_ai_default();
if ((hp <= 0 && (oInit.coop != 2 || global.host)) || force_death)
{
    achievement_progress(0, 1);
}
