alarm[0] = 30;
if (ticks > 0 && instance_exists(parent))
{
    ticks -= 1;
    parent.lastHp = parent.hp;
    parent.hp -= damage;
    draw_damage((parent.x - 13) + (random(26) * (textColor == 5108425)), parent.y - sprite_get_yoffset(parent.sprite_idle) - 4 - climb, global.handlerDamage, ceil(other.damage * random_range(0.9, 1.1)), 0, textColor, textColor);
    repeat (global.graphics - 1)
    {
        part_particles_create_color(global.above, parent.x - (((sprite_get_width(parent.sprite_index) / 2) - random(sprite_get_width(parent.sprite_index))) * random(1.3) * random(1.3)), parent.y - (((sprite_get_height(parent.sprite_index) / 2) - random(sprite_get_height(parent.sprite_index))) * random(1.3) * random(1.3)), global.pPoison, merge_color(c_yellow, #C9F24D, random(1)), 1);
    }
}
else if (ticks == 0)
{
    instance_destroy();
}
