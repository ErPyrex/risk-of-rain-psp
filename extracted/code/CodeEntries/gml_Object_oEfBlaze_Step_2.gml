if (instance_exists(parent) == 0)
{
    instance_destroy();
}
else
{
    x = parent.x;
    y = parent.y;
    repeat (global.graphics)
    {
        part_particles_create_color(global.above, x - (((sprite_get_width(parent.sprite_index) / 2) - random(sprite_get_width(parent.sprite_index))) * random(1.3) * random(1.3)), y - (((sprite_get_height(parent.sprite_index) / 2) - random(sprite_get_height(parent.sprite_index))) * random(1.3) * random(1.3)), global.pPoison, merge_color(c_yellow, c_red, random(1)), 1);
    }
}
