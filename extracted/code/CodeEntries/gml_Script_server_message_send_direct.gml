if (!global.host)
{
    exit;
}
clearbuffer();
writebyte(argument[1]);
writedouble(argument[2]);
writedouble(argument[3]);
switch (argument[1])
{
    case 39:
        writebyte(argument[4]);
        writebyte(argument[5]);
        writebyte(argument[6]);
        writebyte(argument[7]);
        writebyte(argument[8]);
        writebyte(argument[9]);
        writebyte(argument[10]);
        writebyte(argument[11]);
        writebyte(argument[12]);
        writebyte(argument[13]);
        writebyte(argument[14]);
        writebyte(argument[15]);
        break;
    case 19:
        writedouble(argument[4]);
        writedouble(argument[5]);
        writeshort(argument[6]);
        writeshort(argument[7]);
        writebyte(argument[8]);
        writebyte(argument[9]);
        break;
    case 2:
        writedouble(argument[4]);
        writedouble(argument[5]);
        writestring(argument[6]);
        break;
    case 3:
        m_add_player(argument[4], argument[5], argument[6], argument[7], argument[8], argument[9]);
        break;
    case 4:
        writestring(argument[4]);
        break;
    case 5:
        m_update_player(argument[4], argument[5], argument[6], argument[7]);
        break;
}
sendmessage(argument[0]);
