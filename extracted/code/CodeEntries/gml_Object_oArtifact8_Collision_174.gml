if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    collide_item();
    caster_play(139, global.volume, 0.8);
    x -= 100;
    oInit.artifact_found_temp[7] = 1;
}
