if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.shield += 60;
    other.maxshield += 60;
    collide_item();
    if (other.heal_after_kill >= 7 && other.maxshield != 0 && (oInit.coop != 2 || global.my_player == other.id))
    {
        achievement_progress(37, 1);
    }
}
