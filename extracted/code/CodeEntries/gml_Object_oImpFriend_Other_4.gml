if (instance_exists(parent) == 0)
{
    instance_destroy();
}
hp = 610 * power(global.enemy_buff, global.hp_co);
maxhp = 610 * power(global.enemy_buff, global.hp_co);
if (name == "Yggo")
{
    hp = 1410 * power(global.enemy_buff, global.hp_co);
    maxhp = 1410 * power(global.enemy_buff, global.hp_co);
}
