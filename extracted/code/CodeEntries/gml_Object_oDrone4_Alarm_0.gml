if (master.hp < master.maxhp)
{
    if (charge > 0)
    {
        charge -= 1;
        image_index = 0;
        alarm[0] = 30;
        master.hp += 5;
        if (hp >= (maxhp * 0.5))
        {
            sprite_index = sprite_shoot1;
        }
        else
        {
            sprite_index = sprite_shoot1_broken;
        }
        caster_play(158, global.volume, 1.5);
        with (instance_create(master.x, master.y, oEfDamage))
        {
            team = "heal";
            damage = 5;
        }
    }
    else
    {
        alarm[0] = 480;
        charge = 8;
    }
}
else
{
    alarm[0] = 120;
    charge = 8;
}
