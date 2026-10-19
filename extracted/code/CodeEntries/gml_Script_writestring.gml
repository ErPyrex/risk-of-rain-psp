var len = string_byte_length(argument0);
for (var i = 1; i <= len; i++)
{
    yybuffer_write(string_byte_at(argument0, i));
}
yybuffer_write(0);
