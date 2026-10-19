for (var i = 0; i < argument1; i++)
{
    var c = d_file_bin_read_byte(argument0);
    yybuffer_write(c);
}
return argument1;
