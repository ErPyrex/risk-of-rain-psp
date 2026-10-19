for (si = 0; si < ds_list_size(global.screencaps); si += 1)
{
    if (background_exists(ds_list_find_value(global.screencaps, si)))
    {
        background_delete(si);
    }
}
ds_list_clear(global.screencaps);
