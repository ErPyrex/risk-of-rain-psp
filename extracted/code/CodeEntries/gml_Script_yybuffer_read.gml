if (global.yyBuffer == -1 || global.yyBufferStart >= global.yyBufferEnd)
{
    return -1;
}
rval = buffer_peek(global.yyBuffer, global.yyBufferStart, buffer_u8);
global.yyBufferStart++;
if (global.yyBufferStart >= (global.yyBufferSize / 2))
{
    var msize = global.yyBufferEnd - global.yyBufferStart;
    buffer_copy(global.yyBuffer, global.yyBufferStart, msize, global.yyBuffer, 0);
    global.yyBufferStart = 0;
    global.yyBufferEnd = msize;
}
return rval;
