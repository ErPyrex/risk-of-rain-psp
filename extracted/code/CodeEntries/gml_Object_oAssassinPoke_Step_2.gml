parent.hp += hp - maxhp;
actual_hp += (hp - maxhp);
hp = maxhp;
image_alpha = min(image_alpha + 0.2, 1);
if (actual_hp <= 0)
{
    part_particles_create(global.above, (x - 30) + random(60), (y - 30) + random(60), global.pAssassin, 14);
    image_index = 0;
    image_speed = 0;
    image_alpha -= 0.3;
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}
if (floor(image_index) == 8 && hit == 0)
{
    hit = 1;
    s = instance_create(x + (40 * image_xscale), y + 15, oAssassinHit);
    s.team = team;
    s.image_xscale = 1.6;
    s.image_yscale = 2;
    damage_default(s, 1);
    s.parent = id;
}
