yoff -= 0.4;
if (done == 1)
{
    oInit.music_name = -5;
    black_alpha += 0.01;
    if (black_alpha >= 1)
    {
        oEfGameBeat.post_game = 1;
    }
}
if (keyboard_check(vk_anykey))
{
    yoff -= 2;
}
