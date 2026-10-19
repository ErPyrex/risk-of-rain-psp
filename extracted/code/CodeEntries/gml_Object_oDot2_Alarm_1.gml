if (sprite_index == sEfPoison3)
{
    sprite_index = sEfPoison4;
}
else
{
    sprite_index = sEfPoison6;
}
for (i = 0; i <= master.id_count; i += 1)
{
    instance_deactivate_object(master.id_list[i]);
}
var obj;
if (sprite_index == sEfPoison6)
{
    obj = 213;
}
else
{
    obj = 212;
}
repeat (2)
{
    with (instance_create(x, y, obj))
    {
        parent = other.true_parent;
        target = instance_nearest_variable(x, y, 321, "team", "enemy");
        master = other.master;
        if (distance_to_object(target) > 140 || target == -5)
        {
            instance_destroy();
        }
        else
        {
            master.id_count = min(master.id_count + 1, 25);
            master.id_list[master.id_count] = target;
            instance_deactivate_object(target);
        }
        direction = random(360);
    }
}
instance_activate_all();
