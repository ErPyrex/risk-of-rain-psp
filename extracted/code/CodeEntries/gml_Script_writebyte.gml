buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
buffer_write(global.yyConvBuffer, buffer_u8, argument0);
buffer_seek(global.yyConvBuffer, buffer_seek_start, 0);
yybuffer_write(buffer_read(global.yyConvBuffer, buffer_u8));
