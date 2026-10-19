if (show_postgame == 1)
{
    if (oInit.coop != 2)
    {
        post_game = 1;
    }
    else
    {
        with (oEfPlayerDead)
        {
            if (true_player == 1)
            {
                post_game = 1;
            }
            else
            {
                post_game = 2;
            }
        }
    }
}
if (oInit.coop == 2 && true_player)
{
    following = 1;
    oInit.player[1, 2].following_player_index = 2;
    oInit.player[1, 2].following_player = oInit.player[2, 2];
}
