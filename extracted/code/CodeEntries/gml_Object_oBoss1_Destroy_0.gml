with (instance_create(x - 400, room_height, oWurmHead))
{
    type = 1;
    m_id = 9501;
}
with (instance_create(x + 400, room_height, oWurmHead))
{
    type = 2;
    m_id = 9300;
}
instance_create(x, y, oWurmController);
with (instance_create(x, y - 40, oBossText))
{
    text1 = choose("Ah.. you are stronger than you look..", "Hmm..", "A challenge..!");
}
