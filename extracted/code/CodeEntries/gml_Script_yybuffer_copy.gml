var inBuf = argument0;
var inBufSize = buffer_get_size(inBuf);
if (inBufSize > global.yyBufferSize)
{
    global.yyBufferSize = inBufSize;
    buffer_resize(global.yyBuffer, global.yyBufferSize);
}
buffer_copy(inBuf, 0, inBufSize, global.yyBuffer, 0);
global.yyBufferStart = 0;
global.yyBufferEnd = inBufSize;
