if (room == rSelectMult)
{
    refresh_classes();
    with (oSelectMult)
    {
        player[1, 5] = global.my_player.m_id;
    }
}
else if (room == rStart)
{
    instance_destroy();
}
