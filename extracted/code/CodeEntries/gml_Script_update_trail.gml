ds_list_add(trailx, argument0);
ds_list_add(traily, argument1);
if (ds_list_size(trailx) > trail_length)
{
    ds_list_delete(trailx, 0);
    ds_list_delete(traily, 0);
}
