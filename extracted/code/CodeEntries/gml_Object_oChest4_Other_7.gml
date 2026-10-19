if (active == 3)
{
    image_speed = 0;
    image_index = sprite_get_number(sprite_index) - 1;
    if (not_client())
    {
        instance_create(x, y - 20, item_id);
    }
    part_particles_create_color(global.below, x, y, global.pHeal, 65535, 30);
}
