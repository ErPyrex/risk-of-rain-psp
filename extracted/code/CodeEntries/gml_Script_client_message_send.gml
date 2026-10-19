if (global.host)
{
    exit;
}
if (global.my_player.m_id == -1)
{
    exit;
}
var i, yyargs;
for (i = 0; i < argument_count; i++)
{
    yyargs[i] = argument[i];
}
while (i < 16)
{
    yyargs[i] = 0;
    i++;
}
clearbuffer();
writebyte(yyargs[0]);
switch (yyargs[0])
{
    case 48:
        writeshort(yyargs[1]);
        writeshort(yyargs[2]);
        writeshort(yyargs[3]);
        writeshort(yyargs[4]);
        break;
    case 47:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        break;
    case 46:
        writeshort(yyargs[1]);
        writeshort(yyargs[2]);
        writeshort(yyargs[3]);
        break;
    case 41:
        writeshort(yyargs[1]);
        break;
    case 16:
        writestring(yyargs[1]);
        objClient.ping_start = get_timer() / 1000;
        break;
    case 24:
        break;
    case 19:
        writedouble(yyargs[1]);
        writedouble(yyargs[2]);
        writeshort(yyargs[3]);
        writeshort(yyargs[4]);
        writebyte(yyargs[5]);
        break;
    case 14:
        m_sync_alarm(yyargs[1], yyargs[2], yyargs[3], yyargs[4], yyargs[5]);
        break;
    case 0:
        writedouble(yyargs[1]);
        writedouble(yyargs[2]);
        writebyte(yyargs[3]);
        writebyte(yyargs[4]);
        writebyte(yyargs[5]);
        writebyte(yyargs[6]);
        writebyte(yyargs[7]);
        writebyte(yyargs[8]);
        break;
    case 6:
        writeshort(yyargs[1]);
        writeshort(yyargs[2]);
        writebyte(yyargs[3]);
        writebyte(yyargs[4]);
        writebyte(yyargs[5]);
        writebyte(yyargs[6]);
        writeshort(yyargs[7]);
        writebyte(yyargs[8]);
        break;
    case 12:
        writedouble(yyargs[1]);
        writedouble(yyargs[2]);
        writedouble(yyargs[3]);
        break;
    case 13:
        m_create_level_object(yyargs[1], yyargs[2], yyargs[3], yyargs[4], yyargs[5]);
        break;
    case 4:
        writestring(yyargs[1]);
        break;
    case 26:
        writebyte(yyargs[1]);
        writestring(yyargs[2]);
        break;
    case 5:
        m_update_player(yyargs[1], yyargs[2], yyargs[3], yyargs[4]);
        break;
    case 1:
        writebyte(yyargs[1]);
        break;
    case 7:
        m_heal_player(yyargs[1], yyargs[2], yyargs[3], yyargs[4]);
        break;
    case 17:
        break;
}
sendmessage(objClient.sock);
