var xt = 0;
var wid = argument1 / 2;
col = draw_get_color();
var xt_i = 0.1;
texture_set_repeat(1);
var px = ds_list_find_value(trailx, 0);
var py = ds_list_find_value(traily, 0);
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0, 0));
size = ds_list_size(trailx);
for (var i = 0; i < size; i += 1)
{
    var nx = ds_list_find_value(trailx, i);
    var ny = ds_list_find_value(traily, i);
    dir = point_direction(px, py, nx, ny);
    dx = lengthdir_x(wid - ((wid - 2) * (i / size)), dir + 90);
    dy = lengthdir_y(wid - ((wid - 2) * (i / size)), dir + 90);
    var a = draw_get_alpha();
    if (argument2 == 1)
    {
        a = (i - 1) / size;
    }
    xt = (i - 1) / size;
    draw_vertex_texture_color(px + dx, py + dy, xt, 0, c_white, a * image_alpha);
    draw_vertex_texture_color(px - dx, py - dy, xt, 1, c_white, a * image_alpha);
    px = nx;
    py = ny;
    xt += xt_i;
}
draw_primitive_end();
