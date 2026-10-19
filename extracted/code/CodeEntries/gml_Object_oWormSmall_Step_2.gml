if (elite == 1)
{
    image_blend = c_blue;
    elite = 2;
    hp *= 2.8;
    maxhp *= 2.8;
    damage *= 1.3;
}
if (head == -1 && alarm[0] == -1 && global.time_stop == 0)
{
    alarm[0] = ((45 + random(150)) * ceil(hp / maxhp)) / max_speed;
}
worm_speed = 8 + ((1 - (hp / (max_speed * maxhp))) * 8);
worm_gravity = 0.1 + ((1 - (hp / (max_speed * maxhp))) * 0.2);
hp = max(0, hp);
if (head != -1)
{
    if (hp <= 0 && head.dead == 0)
    {
        caster_play(169, global.volume * 3, 2);
        with (head)
        {
            npc_death(1, 0);
        }
    }
}
if (head == -1 && hp <= 0)
{
    instance_destroy();
}
