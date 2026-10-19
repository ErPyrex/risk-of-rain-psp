if (!instance_exists(tt))
{
    exit;
}
if (hp_position == ((string_length(string(tt.maxhp)) * 2) + 1))
{
    alarm[1] = -1;
}
else
{
    alarm[1] = 3;
    hp_position += 1;
}
