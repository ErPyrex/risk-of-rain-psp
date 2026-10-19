var tval = ds_map_find_value(global.Pal_Map, argument[0]);
if (is_undefined(tval))
{
    tval = 0;
}
return ds_list_size(tval);
