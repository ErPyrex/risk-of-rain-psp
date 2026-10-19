var dst = ds_list_create();
with (oP)
{
    if (dead == 0)
    {
        ds_list_add(dst, id);
    }
}
ds_list_shuffle(dst);
var val = ds_list_find_value(dst, 0);
ds_list_destroy(dst);
if (is_undefined(val))
{
    return -4;
}
else
{
    return val;
}
