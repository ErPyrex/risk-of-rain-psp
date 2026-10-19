global.in_game = 0;
global.host = 0;
ds_list_destroy(players);
ds_list_destroy(socks);
with (oPrePlayer)
{
    instance_destroy();
}
with (oP)
{
    instance_destroy();
}
global.my_player = -1;
