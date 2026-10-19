if (global.time_stop == 0)
{
    image_speed2 = 0.2;
    oHUD.alarm[0] = 5;
    caster_play(83, global.volume, 0.6);
    repeat (max_bullets)
    {
        s = instance_create(x, y, oTurtleMissile);
        s.damage = damage * 0.6;
        s.parent = id;
        s.team = team;
        s.critical = 0;
        s.alarm[0] = 50;
        s.image_blend = image_blend;
    }
}
alarm[1] = bullets_cooldown - (bullets_cooldown * 0.5 * (1 - (hp / maxhp)));
