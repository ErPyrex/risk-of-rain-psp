if (active == 1)
{
    caster_play(146, global.volume, 1);
    active = 2;
    image_speed = 0.2;
    oHUD.alarm[0] = 6;
    alarm[0] = 1;
    time = 900;
    minions = 2 + (oInit.player_number * 3);
    minions_dead = 0;
}
time = max(time - 1, 0);
