if (global.client_connected != -1)
{
    network_destroy(sock);
    global.client_connected = -1;
    with (instance_create(x, y, oError))
    {
        text1 = "Disconnected from host!";
    }
    instance_destroy();
}
