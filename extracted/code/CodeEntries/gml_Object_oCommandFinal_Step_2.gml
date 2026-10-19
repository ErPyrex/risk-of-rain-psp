if (active == 1)
{
    caster_play(66, global.volume, 1);
    active = 2;
    with (oP)
    {
        if (id == global.my_player || oInit.coop != 2)
        {
            var t = instance_create(x, y, oEfGameBeat);
            t.class = class;
            t.true_player = 1;
            t.player_index = sprite_idle;
            t.player_name = name;
        }
    }
    with (instance_create(x, y, oBlackIn))
    {
        rate = 0.02;
    }
    alarm[0] = 300;
}
