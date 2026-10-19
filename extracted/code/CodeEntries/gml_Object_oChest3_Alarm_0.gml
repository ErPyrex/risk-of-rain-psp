if (item_id == -5)
{
    drop_item(1);
    part_particles_create_color(global.below, x, y, global.pHeal, 65535, 30);
}
else if (item_id != -1)
{
    instance_create(x, y - 20, item_id);
    part_particles_create_color(global.below, x, y, global.pHeal, 65535, 30);
}
