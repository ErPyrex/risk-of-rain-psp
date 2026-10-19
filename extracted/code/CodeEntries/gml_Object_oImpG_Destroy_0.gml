boss_death();
y += 30;
if (oInit.coop == 2 && !global.host)
{
    exit;
}
if (random(100) < 85 || oInit.coop == 2 || global.artifact_command)
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
    instance_create(x, y - 15, oImpTentacle);
}
