if (!instance_exists(tt))
{
    exit;
}
if (name_position == string_length(tt.name))
{
    alarm[0] = -1;
    alarm[1] = 30;
}
else
{
    alarm[0] = 3;
    name_position += 1;
}
