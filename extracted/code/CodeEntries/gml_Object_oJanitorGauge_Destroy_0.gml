if (instance_exists(parent))
{
    caster_play(167, global.volume, 1.3);
    parent.attack_speed -= 0.3;
    parent.stun -= 0.3;
    with (parent)
    {
        sprite_idle = 96;
        sprite_walk = 100;
        sprite_jump = 98;
        sprite_shoot1 = 102;
        sprite_shoot3 = 114;
        if (scepter == 0)
        {
            sprite_shoot4 = 104;
        }
        else
        {
            sprite_shoot4 = 106;
        }
        sprite_climb = 94;
        sprite_dead = 110;
    }
}
