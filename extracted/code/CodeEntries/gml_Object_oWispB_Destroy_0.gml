boss_death();
y += 30;
if (random(100) < 85 || global.artifact_command)
{
    if (global.director.boss_drop == 0)
    {
        global.director.boss_drop = 1;
        drop_item(2);
    }
    else
    {
        drop_item(1);
    }
}
else
{
    instance_create(x, y - 15, oPauldron);
}
y -= 30;
with (oP)
{
    if (class == 4 && last_hit_number == 0 && (oInit.coop != 2 || global.my_player == id))
    {
        achievement_progress(22, 1);
    }
}
if (oInit.coop != 2 || global.host)
{
    repeat (2)
    {
        with (instance_create(x, y, oWispG))
        {
            sync = 1;
        }
        with (instance_create(x, y, oWisp))
        {
            sync = 1;
        }
    }
}
oHUD.boss = -1;
