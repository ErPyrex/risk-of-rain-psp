audio_stop_sound(wCutsceneAlarm);
with (instance_create(x, y, oWhiteFlash))
{
    rate = 0.1;
}
instance_create(4800, 1279, oBoss1);
s = instance_create(4800, 1279, oEfBullet2);
s.sprite_index = sEfRecall;
s.image_yscale = 1;
caster_play(157, global.volume, 1);
