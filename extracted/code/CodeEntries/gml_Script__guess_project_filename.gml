var c = parameter_count();
if (c < 1)
{
    return "";
}
var exename = string_delete(parameter_string(0), 1, _string_rpos("\", parameter_string(0)));
if (exename == "Runner.exe")
{
    if (c >= 3)
    {
        if (parameter_string(1) == "-game")
        {
            exename = string_delete(parameter_string(2), 1, _string_rpos("\", parameter_string(2)));
        }
    }
}
return string_copy(exename, 1, _string_rpos(".", exename) - 1);
