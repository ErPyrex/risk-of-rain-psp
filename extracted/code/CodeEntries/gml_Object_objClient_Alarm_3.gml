if (connect_attempts > 2)
{
    with (instance_create(x, y, oError))
    {
        text1 = "Failed to connect!";
    }
    instance_destroy();
    exit;
}
if (sock == -1)
{
    connect_attempts += 1;
    sock = network_create_socket(network_socket_tcp);
    alarm[3] = 60;
    exit;
}
if (network_connect(sock, ip, port) < 0)
{
    connect_attempts += 1;
    alarm[3] = 60;
}
else
{
    alarm[1] = 1;
}
