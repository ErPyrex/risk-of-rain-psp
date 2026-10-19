alarm[11] = 60;
if (global.host && id != global.my_player)
{
    lag += 1;
}
if (lag > global.server_timeout)
{
    with (objServer)
    {
        disconnect_player(other.id, 0, 0);
    }
}
