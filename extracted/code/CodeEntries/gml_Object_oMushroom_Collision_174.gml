if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.mushroom += 1;
    if (other.nugget > 0 && other.mushroom > 0 && other.percent_hp > 0 && other.egg_regen > 0 && other.use[0] == 419)
    {
        achievement_progress(49, 1);
    }
    collide_item();
}
