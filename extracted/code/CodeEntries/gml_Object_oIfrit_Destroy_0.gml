boss_death();
if (oInit.coop == 2 && !global.host)
{
    exit;
}
y += 50;
if (random(100) < 85)
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
    instance_create(x, y - 15, oHorn);
}
y -= 50;
