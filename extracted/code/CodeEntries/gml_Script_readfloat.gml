buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
repeat (4)
{
    buffer_write(global.yyConvBuffer, buffer_u8, yybuffer_read());
}
buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
return buffer_read(global.yyConvBuffer, buffer_f32);
