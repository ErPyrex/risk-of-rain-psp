global.chatting = 0;
global.my_player = -1;
global.host = 0;
global.host_player = -1;
global.in_game = 0;
global.npc_index = 1;
global.chest_index = 1;
global.treasure_index = 1;
global.player_index = 1;
global.helper_index = -1;
global.yyBufferSize = 16384;
global.yyBuffer = buffer_create(global.yyBufferSize, buffer_fast, 1);
global.yyBufferStart = 0;
global.yyBufferEnd = 0;
global.yyConvBuffer = buffer_create(1024, buffer_grow, 1);
global.yyNetQueue = ds_queue_create();
global.client_connected = -1;
m_id = 0;
if (argument0 == 1)
{
    sock = -1;
    name = "";
    login = "";
    player_set = 1;
    lag_check = 0;
    ping = "---";
}
