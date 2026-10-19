if (simult_kill_count >= simult_kill && (oInit.coop != 2 || global.my_player == parent))
{
    achievement_progress(18, 1);
}
if (instance_exists(parent))
{
    if (dynamite_on_hit != 0 && hit_number != 0)
    {
        instance_create(parent.x, parent.y, oEfDyno);
    }
    if (shield_on_hit != 0 && hit_number != 0)
    {
        parent.shield_gained += shield_on_hit * hit_number;
        parent.maxshield = parent.shield_gained;
        parent.shield_cooldown = 0;
    }
    if (lifesteal != 0 && hit_number != 0)
    {
        parent.hp = min(parent.maxhp, parent.hp + ((2 + ((lifesteal - 1) * 1)) * (log10(hit_number) + 1)));
        draw_damage(parent.x, parent.y - parent.sprite_yoffset, global.handlerDamage, string(ceil((2 + ((lifesteal - 1) * 1)) * (log10(hit_number) + 1))), 0, 6870916, 6870916);
    }
    if (hit != 0 && steam >= 1)
    {
        if (instance_exists(parent.gauge))
        {
            parent.gauge.steam = min(100, parent.gauge.steam + (6 * steam));
        }
    }
    if (critical == 1 && skull_ring != 0 && hit_number != 0)
    {
        with (instance_create(parent.x, parent.y, oEfBullet2))
        {
            sprite_index = sEfSkull;
            image_yscale = 1;
            image_alpha = 0.5;
        }
        parent.alarm[3] = max(0, parent.alarm[3] - (60 * skull_ring));
        parent.alarm[4] = max(0, parent.alarm[4] - (60 * skull_ring));
        parent.alarm[5] = max(0, parent.alarm[5] - (60 * skull_ring));
    }
    if (critical && wolfblood != 0 && hit_number != 0)
    {
        apply_buff(parent, 25, 180);
    }
    if (blaster != 0 && hit_number != 0)
    {
        caster_play(87, global.volume * 0.3, random_range(1.8, 2));
        with (instance_create(parent.x, parent.y, oEfBlaster))
        {
            direction = 90 - (90 * other.parent.image_xscale);
            parent = other.parent;
            team = "playerproc";
            max_bounce = 1 + other.blaster;
            climb = other.climb + 8;
        }
        blaster = 0;
    }
}
