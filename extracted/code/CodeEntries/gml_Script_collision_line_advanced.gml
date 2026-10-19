var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var obj = argument4;
var prec = argument5;
var notme = argument6;
var first_instance = collision_line(x1, y1, x2, y2, obj, prec, notme);
if (first_instance != -4)
{
    var dx = x2 - x1;
    var dy = y2 - y1;
    while (abs(dx) >= 1 || abs(dy) >= 1)
    {
        dx /= 2;
        dy /= 2;
        var instance = collision_line(x1, y1, x2 - dx, y2 - dy, obj, prec, notme);
        if (instance != -4)
        {
            first_instance = instance;
            x2 -= dx;
            y2 -= dy;
        }
    }
}
global.collision_x = x2;
global.collision_y = y2;
return first_instance;
