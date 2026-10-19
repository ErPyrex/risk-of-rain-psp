if (true_choice == 2)
{
    port_open = 0;
    httpID_port = http_get("http://www.riskofraingame.com/checkport.php?port=" + string(global.host_port));
}
true_choice = -1;
