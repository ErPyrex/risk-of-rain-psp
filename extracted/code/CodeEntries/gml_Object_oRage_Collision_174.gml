if (!item_checkout(other.id))
{
    exit;
}
if (alarm[0] == -1 && used == 0)
{
    used = 1;
    other.hp_after_kill += 1;
    oHUD.health_color[other.player_id - 1] = make_color_rgb(169, 63, 66);
    collide_item();
}
