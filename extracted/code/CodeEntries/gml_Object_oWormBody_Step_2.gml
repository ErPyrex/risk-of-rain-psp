if (image_blend != c_white)
{
    sprite_index = sWormBodyElectric;
}
if (instance_exists(head))
{
    if (lastHp > hp)
    {
        caster_play(171, global.volume * 0.8, 1);
        head.hp += hp - lastHp;
    }
    hp = head.hp;
    lastHp = hp;
}
if (inside_view(x, y) == 1)
{
    if (random(100) < 5 && global.graphics == 3)
    {
        part_particles_create(global.below, x, y, global.pSpark, 1);
    }
}
if (global.time_stop != 0)
{
    x = xprevious;
    y = yprevious;
    image_speed = 0;
}
else
{
    image_speed = 0.3;
}
