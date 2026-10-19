if (other.invincible == 0 && other.hp > 0 && global.time_stop == 0)
{
    with (other)
    {
        repeat (global.graphics)
        {
            part_particles_create_color(global.above, x - (((sprite_get_width(sprite_index) / 2) - random(sprite_get_width(sprite_index))) * random(1.3) * random(1.3)), y - (((sprite_get_height(sprite_index) / 2) - random(sprite_get_height(sprite_index))) * random(1.3) * random(1.3)), global.pPoison, merge_color(c_yellow, c_red, random(1)), 1);
        }
    }
    if (other.dot_immune == 0)
    {
        damage = ceil(min(other.maxhp * 0.04, damage * random_range(0.8, 1)));
        other.lastHp = other.hp;
        other.hp -= damage;
        other.lasthit_x = random_range(x, x + (width_b * 16));
        other.dot_immune = 30;
        s = instance_create(other.x, other.y, oEfDamage);
        s.textColor = 1925048;
        s.damage = string(damage);
        s = instance_create((other.x - 5) + random(10), ((other.y - 5) + random(10)) - 10, oEfBullet2);
        s.sprite_index = sWispSpark;
        damage = damage_original;
    }
}
if (other.object_index == oP && lava_timer == lava_timer_previous)
{
    if (other.dead == 0)
    {
        lava_timer += 1;
        if (lava_timer == 3600)
        {
            achievement_progress(11, 1);
        }
    }
}
