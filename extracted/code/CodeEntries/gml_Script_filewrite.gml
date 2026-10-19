for (var i = global.yyBufferStart; i < global.yyBufferEnd; i++)
{
    var c = buffer_peek(global.yyBuffer, i, buffer_u8);
    d_file_bin_write_byte(argument0, c);
}
