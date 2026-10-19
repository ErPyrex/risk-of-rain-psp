x = argument0;
y = argument1;
force_z = argument2;
force_x = argument3;
force_c = argument4;
force_v = argument5;
hp = maxhp * (argument7 / 100);
if (argument6 > 0)
{
    use_item(1, argument6);
}
server_message_send(sock, 6, object_index, m_id, argument0, argument1, argument2, argument3, argument4, argument5, argument6);
