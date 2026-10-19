f = -300 + random(600);
head = instance_create(target.x + (f * (1.5 + (1 * (1 - (hp / maxhp))))), target.y + 800, oWormHeadSmall);
head.controller = id;
head.speed = worm_speed;
head.worm_gravity = worm_gravity;
head.target = target;
head.image_blend = image_blend;
head.damage = 128;
s = instance_create(target.x + (f / 3), target.y - 32, oWormWarning);
with (s)
{
    move_contact_solid(270, -1);
}
head.direction = point_direction(head.x, head.y, s.x, s.y);
head.hp = hp;
s.alarm[0] = point_distance(head.x, head.y, s.x, s.y) / worm_speed;
head.alarm[1] = s.alarm[0];
