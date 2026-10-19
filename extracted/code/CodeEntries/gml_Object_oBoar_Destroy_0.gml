y += 25;
boss_death();
if (global.director.boss_drop == 0)
{
    global.director.boss_drop = 1;
    drop_item(2);
}
else
{
    drop_item(1);
}
y -= 25;
