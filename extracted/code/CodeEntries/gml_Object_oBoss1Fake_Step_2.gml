if (walking == 1)
{
    x += 1;
    sprite_index = sBoss1Walk;
    if ((x - xstart) >= 64)
    {
        walking = 0;
        sprite_index = sBoss1Idle;
        alarm[0] = 60;
    }
}
if (walking == -1 && floor(image_index) == 9)
{
    room_goto(rCutscene3);
}
