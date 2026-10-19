var xx = argument0;
var yy = argument1;
var oo = argument2;
var Var = argument3;
var v_intended = argument4;
var ins = -10;
var ds = ds_priority_create();
ds_priority_add(ds, ins, 1000000);
with (oo)
{
    var v = 0;
    v = team;
    if (v == v_intended)
    {
        ds_priority_add(ds, id, point_distance(x, y, xx, yy));
    }
}
ins = ds_priority_find_min(ds);
ds_priority_destroy(ds);
return ins;
