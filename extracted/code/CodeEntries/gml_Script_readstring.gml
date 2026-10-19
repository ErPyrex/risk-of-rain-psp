var sep = 0;
if (argument_count == 2)
{
    sep = argument[1];
}
buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
for (var ssize = 0; argument[0] == 0 || ssize < argument[0]; ssize++)
{
    var c = yybuffer_read();
    if (c == -1 || c == sep)
    {
        break;
    }
    buffer_write(global.yyConvBuffer, buffer_u8, c);
}
buffer_write(global.yyConvBuffer, buffer_u8, 0);
buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
return buffer_read(global.yyConvBuffer, buffer_string);
