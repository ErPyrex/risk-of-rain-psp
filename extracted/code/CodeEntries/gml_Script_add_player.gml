var temp = instance_create(argument0, argument1, oPrePlayer);
temp.m_id = argument2;
oSelectMult.player[instance_number(oPrePlayer), 5] = temp.m_id;
temp.class = argument3;
var tbar = string_pos("|", argument5);
temp.user_name = string_copy(argument5, 0, tbar - 1);
temp.login = string_copy(argument5, tbar + 1, string_length(argument5) - tbar);
if (argument4 > 0)
{
    global.host_player = temp.id;
}
temp.player_set = 1;
refresh_classes();
with (oPrePlayer)
{
    ready = 0;
}
