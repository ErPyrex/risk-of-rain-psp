if (room == rSelectMult)
{
    oSelectMult.players_locked = 0;
    with (oPrePlayer)
    {
        if (ready)
        {
            oSelectMult.players_locked += 1;
        }
        else if (id == global.my_player)
        {
            oSelectMult.player[oSelectMult.player_id, 3] = 0;
        }
    }
}
if (global.chatting == 1)
{
    keyboard_string = string_replace_all(keyboard_string, "#", "");
}
else
{
    alpha -= 0.2;
}
