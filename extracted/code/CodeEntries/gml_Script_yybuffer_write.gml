if (global.yyBufferEnd >= global.yyBufferSize)
{
    global.yyBufferSize = global.yyBufferSize * 2;
    buffer_resize(global.yyBuffer, global.yyBufferSize);
}
buffer_poke(global.yyBuffer, global.yyBufferEnd, buffer_u8, argument0);
global.yyBufferEnd++;
