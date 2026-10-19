var srch = "&";
var string_current = argument2;
var hashcount = string_count("#", string_current);
switch (hashcount > 0)
{
    case 1:
        for (iii = 0; iii <= hashcount; iii += 1)
        {
            str_line[iii] = string_copy(string_current, 0, string_pos("#", string_current));
            string_current = string_copy(string_current, string_pos("#", string_current) + 1, (string_length(string_current) - string_pos("#", string_current)) + 1);
        }
        str_line[hashcount] = string_current;
        break;
    case 0:
        str_line[hashcount] = argument2;
        break;
}
for (hhh = 0; hhh <= hashcount; hhh += 1)
{
    string_current = "! " + str_line[hhh];
    var colcount = string_count(srch, str_line[hhh]) / 2;
    for (iii = 0; iii <= colcount; iii += 1)
    {
        str_col[iii] = string_copy(string_current, 0, string_pos(srch, string_current) - 1);
        string_current = string_replace(string_copy(string_current, string_pos(srch, string_current) + 1, (string_length(string_current) - string_pos(srch, string_current)) + 1), srch, " ");
    }
    str_col[colcount] = string_replace(string_copy(string_current, string_pos(srch, string_current) + 1, (string_length(string_current) - string_pos(srch, string_current)) + 1), srch, " ");
    for (iii = 0; iii <= colcount; iii += 1)
    {
        dcol[iii] = string_copy(str_col[iii], 0, string_pos(" ", str_col[iii]) - 1);
        dtext[iii] = string_repeat("#", hhh) + string_copy(str_col[iii], string_pos(" ", str_col[iii]) + 1, (string_length(str_col[iii]) - string_pos(" ", str_col[iii])) + 2);
    }
    for (iii = 0; iii <= colcount; iii += 1)
    {
        switch (dcol[iii])
        {
            case "r":
                dcol[iii] = string(6710991);
                break;
            case "b":
                dcol[iii] = string(make_color_rgb(49, 154, 210));
                break;
            case "g":
                dcol[iii] = string(8828542);
                break;
            case "y":
                dcol[iii] = string(8114927);
                break;
            case "or":
                dcol[iii] = string(make_color_rgb(249, 115, 34));
                break;
            case "bl":
                dcol[iii] = string(0);
                break;
            case "lt":
                dcol[iii] = string(12632256);
                break;
            case "dk":
                dcol[iii] = string(4210752);
                break;
            case "w":
                dcol[iii] = string(16777215);
                break;
            case "p":
                dcol[iii] = string(make_color_rgb(236, 94, 211));
                break;
            case "gr":
                dcol[iii] = string(make_color_rgb(189, 190, 194));
                break;
        }
    }
    var current_width = 0;
    for (iii = 0; iii <= colcount; iii += 1)
    {
        switch (dcol[iii] == "!")
        {
            case 1:
                draw_text(argument0 + current_width, argument1, dtext[iii]);
                break;
            case 0:
                draw_text_colour(argument0 + current_width, argument1, dtext[iii], real(dcol[iii]), real(dcol[iii]), real(dcol[iii]), real(dcol[iii]), draw_get_alpha());
                break;
        }
        current_width += string_width(dtext[iii]);
    }
}
return hashcount;
