var msize = global.yyBufferEnd - global.yyBufferStart;
if (global.yyBufferStart > 0)
{
    buffer_copy(global.yyBuffer, global.yyBufferStart, msize, global.yyBuffer, 0);
    global.yyBufferStart = 0;
    global.yyBufferEnd = msize;
}
network_send_packet(argument0, global.yyBuffer, msize);
