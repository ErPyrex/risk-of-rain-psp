if (argument0.object_index == oPrePlayer)
{
    global.player_index += 1;
    return global.player_index;
}
else
{
    global.npc_index += 1;
    return global.npc_index;
}
