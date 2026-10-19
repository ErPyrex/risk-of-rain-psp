if (hit == 0 && other.team != team && image_blend == c_red)
{
    caster_play(167, global.volume, 1);
    hit = 1;
    other.hp -= (damage * 0.5);
    other.lasthit_x = x;
    damage_default(id, 1);
    s = instance_create(x, y, oEfDamage);
    s.team = team;
    s.damage = string(damage);
    s.critical = 0;
    s = instance_create((other.x - 5) + random(10), ((other.y - 5) + random(10)) - 10, oEfBullet2);
    s.sprite_index = sWispSpark;
    alarm[1] = 60;
}
