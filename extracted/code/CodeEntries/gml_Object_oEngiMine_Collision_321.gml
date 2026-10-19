if (active == 1 && instance_exists(parent) && other.team != "player")
{
    caster_play(81, global.volume, 3);
    active = 2;
    image_index = 0;
    image_speed = 0.3;
    sprite_index = sEngiMineJump;
}
