buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
buffer_write(global.yyConvBuffer, buffer_s32, argument0);
buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
repeat (4)
{
    yybuffer_write(buffer_read(global.yyConvBuffer, buffer_u8));
}
