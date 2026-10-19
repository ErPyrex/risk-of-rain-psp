var _shader = argument[0];
var _spr1 = argument[1];
var _pal1 = argument[2];
_pal1 = clamp(_pal1, 0, pal_swap_get_pal_count(_spr1) - 1);
var _spr2 = argument[3];
var _pal2 = argument[4];
_pal2 = clamp(_pal2, 0, pal_swap_get_pal_count(_spr2) - 1);
if (shader_is_compiled(_shader))
{
    shader_set(_shader);
    var _palettes1 = ds_map_find_value(global.Pal_Map, _spr1);
    var _palettes2 = ds_map_find_value(global.Pal_Map, _spr2);
    var _colors = ds_list_find_value(_palettes1, _pal1);
    for (var i = 0; i < ds_list_size(_colors); i++)
    {
        var _col = ds_list_find_value(_colors, i);
        var _r = color_get_red(_col) / 255;
        var _g = color_get_green(_col) / 255;
        var _b = color_get_blue(_col) / 255;
        shader_set_uniform_f(shader_get_uniform(_shader, "f_Colour" + string(i)), _r, _g, _b);
    }
    _colors = ds_list_find_value(_palettes2, _pal2);
    for (var i = 0; i < ds_list_size(_colors); i++)
    {
        var _col = ds_list_find_value(_colors, i);
        var _r = color_get_red(_col) / 255;
        var _g = color_get_green(_col) / 255;
        var _b = color_get_blue(_col) / 255;
        shader_set_uniform_f(shader_get_uniform(_shader, "s_Colour" + string(i)), _r, _g, _b);
    }
}
else if (!shader_is_compiled(_shader))
{
    show_debug_message("Shader did not compile correctly. Crap.");
}
