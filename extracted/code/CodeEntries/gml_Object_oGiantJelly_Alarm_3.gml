if (bullets == 0)
{
    alarm[3] = (240 * (hp / maxhp)) + 120;
    bullets = max_bullets;
}
else
{
    alarm[3] = 10;
    bullets -= 1;
    s = instance_create(x, y, oJellyMissile);
    s.damage = damage * 1.3;
    s.parent = id;
    s.target = target;
    s.team = team;
    s.critical = 0;
    s.lightning = lightning;
    s.image_blend = image_blend;
    s.alarm[0] = 60 / attack_speed;
}
