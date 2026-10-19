var xof = 0;
var yof = 4 - min(true_parent.pHspeed * 3, 4);
var len = 3;
if (true_parent == parent)
{
    xof = 0;
    yof = 0;
}
target_x = parent.x + xof;
target_y = parent.y + yof;
var dir = point_direction(parent.x, parent.y, ((x * 1) + target_x) / 2, ((y * 1) + target_y) / 2);
len = 3;
x = parent.x + lengthdir_x(len, dir);
y = parent.y + lengthdir_y(len, dir);
