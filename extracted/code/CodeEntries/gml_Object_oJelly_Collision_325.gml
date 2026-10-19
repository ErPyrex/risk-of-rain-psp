if (hit == 0 && other.team != team && other.invincible == 0)
{
    caster_play(40, global.volume, 1);
    hit = 1;
    other.hp -= damage;
    other.lasthit_x = x;
    other.last_hit = object_index;
    other.last_hit_name = "Jellyfish";
    s = instance_create(x, y, oEfDamage);
    s.team = team;
    s.damage = string(damage);
    s.critical = 0;
    s = instance_create((other.x - 5) + random(10), ((other.y - 5) + random(10)) - 10, oEfBullet2);
    s.sprite_index = sSparks2;
    alarm[1] = 60;
}
