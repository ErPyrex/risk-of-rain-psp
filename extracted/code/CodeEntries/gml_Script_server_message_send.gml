if (!global.host)
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
writebyte(yyargs[1]);
if (yyargs[1] == 29)
{
    s_item_proc(yyargs[2], yyargs[3], yyargs[4], yyargs[5], yyargs[6], yyargs[7], yyargs[8]);
}
else
{
    writedouble(yyargs[2]);
    writedouble(yyargs[3]);
}
switch (yyargs[1])
{
    case 48:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        writeshort(yyargs[6]);
        writeshort(yyargs[7]);
        break;
    case 47:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        break;
    case 45:
        writeshort(yyargs[4]);
        break;
    case 44:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        writefloat(yyargs[6]);
        writeshort(yyargs[7]);
        writeshort(yyargs[8]);
        writeshort(yyargs[9]);
        writebyte(yyargs[10]);
        writeshort(yyargs[11]);
        writedouble(yyargs[12]);
        break;
    case 43:
        break;
    case 42:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        break;
    case 41:
        writeshort(yyargs[4]);
        break;
    case 40:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        writefloat(yyargs[6]);
        writefloat(yyargs[7]);
        break;
    case 39:
        writebyte(yyargs[4]);
        writebyte(yyargs[5]);
        writebyte(yyargs[6]);
        writebyte(yyargs[7]);
        writebyte(yyargs[8]);
        writebyte(yyargs[9]);
        writebyte(yyargs[10]);
        writebyte(yyargs[11]);
        writebyte(yyargs[12]);
        writebyte(yyargs[13]);
        writebyte(yyargs[14]);
        writebyte(yyargs[15]);
        break;
    case 38:
        writeshort(yyargs[4]);
        break;
    case 37:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        break;
    case 36:
        writeshort(yyargs[4]);
        break;
    case 35:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        writeshort(yyargs[6]);
        writebyte(yyargs[7]);
        writebyte(yyargs[8]);
        break;
    case 34:
        writedouble(yyargs[4]);
        writeshort(yyargs[5]);
        writeshort(yyargs[6]);
        break;
    case 32:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        break;
    case 31:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        writeshort(yyargs[6]);
        writeshort(yyargs[7]);
        writeshort(yyargs[8]);
        writeshort(yyargs[9]);
        writeshort(yyargs[10]);
        break;
    case 30:
        writebyte(yyargs[4]);
        break;
    case 16:
        writestring(yyargs[4]);
        break;
    case 27:
        break;
    case 25:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        break;
    case 24:
        break;
    case 23:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writeint(yyargs[6]);
        writeint(yyargs[7]);
        writedouble(yyargs[8]);
        writebyte(yyargs[9]);
        writeshort(yyargs[10]);
        writeshort(yyargs[11]);
        writeshort(yyargs[12]);
        writedouble(yyargs[13]);
        break;
    case 22:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writebyte(yyargs[6]);
        writedouble(yyargs[7]);
        break;
    case 21:
        writedouble(yyargs[4]);
        break;
    case 20:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writeint(yyargs[6]);
        break;
    case 19:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writeshort(yyargs[6]);
        writeshort(yyargs[7]);
        writebyte(yyargs[8]);
        writebyte(yyargs[9]);
        break;
    case 8:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writedouble(yyargs[6]);
        writeshort(yyargs[7]);
        writeshort(yyargs[8]);
        writeshort(yyargs[9]);
        break;
    case 12:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        break;
    case 10:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writeint(yyargs[6]);
        writeshort(yyargs[7]);
        writebyte(yyargs[8]);
        break;
    case 11:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writebyte(yyargs[6]);
        writebyte(yyargs[7]);
        writebyte(yyargs[8]);
        writebyte(yyargs[9]);
        writeshort(yyargs[10]);
        break;
    case 15:
        writeshort(yyargs[4]);
        writedouble(yyargs[5]);
        writedouble(yyargs[6]);
        writebyte(yyargs[7]);
        writeshort(yyargs[8]);
        writeshort(yyargs[9]);
        writeshort(yyargs[10]);
        break;
    case 0:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writebyte(yyargs[6]);
        writebyte(yyargs[7]);
        writebyte(yyargs[8]);
        writebyte(yyargs[9]);
        writebyte(yyargs[10]);
        writebyte(yyargs[11]);
        break;
    case 6:
        writeshort(yyargs[4]);
        writeshort(yyargs[5]);
        writebyte(yyargs[6]);
        writebyte(yyargs[7]);
        writebyte(yyargs[8]);
        writebyte(yyargs[9]);
        writeshort(yyargs[10]);
        writebyte(yyargs[11]);
        break;
    case 18:
        writedouble(yyargs[4]);
        writedouble(yyargs[5]);
        writedouble(yyargs[6]);
        writedouble(yyargs[7]);
        writedouble(yyargs[8]);
        writebyte(yyargs[9]);
        break;
    case 1:
        writebyte(yyargs[4]);
        break;
    case 2:
        writedouble(yyargs[4]);
        break;
    case 3:
        m_add_player(yyargs[4], yyargs[5], yyargs[6], yyargs[7], yyargs[8], yyargs[9]);
        break;
    case 4:
        writestring(yyargs[4]);
        break;
    case 26:
        writebyte(yyargs[4]);
        writestring(yyargs[5]);
        break;
    case 5:
        m_update_player(yyargs[4], yyargs[5], yyargs[6], yyargs[7]);
        break;
    case 7:
        m_heal_player(yyargs[4], yyargs[5], yyargs[6], yyargs[7]);
        break;
    case 13:
        m_create_level_object(yyargs[4], yyargs[5], yyargs[6], yyargs[7], yyargs[8]);
        break;
    case 14:
        m_sync_alarm(yyargs[4], yyargs[5], yyargs[6], yyargs[7], yyargs[8]);
        break;
    default:
        break;
}
for (ii = 0; ii < ds_list_size(objServer.socks); ii += 1)
{
    var tp = ds_list_find_value(objServer.socks, ii);
    if (tp != yyargs[0])
    {
        sendmessage(tp);
    }
}
