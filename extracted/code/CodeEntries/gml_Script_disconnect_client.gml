global.in_game = 0;
network_destroy(sock);
global.client_connected = -1;
with (oPrePlayer)
{
    instance_destroy();
}
global.my_player = -1;
if (room != r2Cutscene2)
{
    room_goto(rStart);
}
