draw_self();
draw_buff();
if (global.debug == 1)
{
    draw_text(x, y - 20, state);
}
if (oHUD.boss == 1 && oHUD.boss_id != id)
{
    draw_hp_bar(1);
}
