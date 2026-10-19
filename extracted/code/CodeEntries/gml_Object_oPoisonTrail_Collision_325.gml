if (other.dot_immune == 0 && other.team != team && other.invincible == 0)
{
    hit = 1;
    other.lastHp = other.hp;
    other.hp -= damage;
    other.lasthit_x = x;
    other.dot_immune = 30;
    draw_damage(other.x - 13, other.y - sprite_get_yoffset(other.sprite_idle) - 4, global.handlerDamage, damage, 0, 5108425, 5108425);
    s = instance_create((other.x - 5) + random(10), ((other.y - 5) + random(10)) - 10, oEfBullet2);
    s.sprite_index = sBite2;
    apply_buff(other.id, 1, 60);
}
