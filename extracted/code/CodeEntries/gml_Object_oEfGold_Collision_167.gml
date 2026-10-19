var tsplit = 1;
if (oInit.coop == 2)
{
    tsplit = instance_number(oP);
}
oHUD.gold += (value / tsplit);
oHUD.total_gold += (value / tsplit);
if (oHUD.gold >= 20000)
{
    achievement_progress(42, 1);
}
instance_destroy();
if (other.gold_cooldown == 0)
{
    other.gold_cooldown = 6;
    caster_play(55, global.volume, 1);
}
