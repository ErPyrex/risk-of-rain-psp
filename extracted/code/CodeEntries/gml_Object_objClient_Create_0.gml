with (objServer)
{
    instance_destroy();
}
with (objClient)
{
    if (id != other.id)
    {
        instance_destroy();
    }
}
checks = 0;
timeout = 0;
sent = 0;
global.chatting = 0;
chat = ds_list_create();
color = ds_list_create();
alpha = 30;
init_client();
damage = 0;
critical = 0;
team = "";
connect_attempts = 0;
last_message = "";
player_set = "NO PLAYER";
alarm[3] = 1;
