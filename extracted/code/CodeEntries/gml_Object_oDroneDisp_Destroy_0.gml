if (hp <= 0)
{
    caster_play(72, global.volume, 1);
    part_particles_create(global.above, x, y, global.pSpark, 6);
    oHUD.alarm[0] = 10;
    with (instance_create(x, y, oEfBullet2))
    {
        sprite_index = sDroneDeath;
        image_yscale = 1;
    }
}
