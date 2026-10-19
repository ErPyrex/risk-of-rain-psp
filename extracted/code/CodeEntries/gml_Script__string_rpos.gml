var sub = argument0;
var str = argument1;
var pos = 0;
var ind = 0;
do
{
    pos += ind;
    ind = string_pos(sub, str);
    str = string_delete(str, 1, ind);
}
until (ind == 0);
if (pos == 0)
{
    pos = string_length(str);
}
return pos;
