alarm[11] = 60;
if (global.host)
{
    lag += 1;
}
if (lag > global.server_timeout && id != global.my_player)
{
    with (objServer)
    {
        disconnect_player(other.id, 0, 0);
    }
}
