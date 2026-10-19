if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    collide_item();
    other.heal_after_kill += 1;
    if (other.heal_after_kill >= 7 && other.maxshield != 0 && (oInit.coop != 2 || global.my_player == other.id))
    {
        achievement_progress(37, 1);
    }
}
