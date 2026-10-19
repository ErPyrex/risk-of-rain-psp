x = parent.x + lengthdir_x(parent.calf_length, parent.angle);
y = parent.y + lengthdir_y(parent.calf_length, parent.angle);
switch (sign(cos(degtorad(parent.parent.ff + 90))))
{
    case -1:
        angle = turn_towards_advanced(angle, 250, 0.5);
        break;
    case 1:
        angle = turn_towards_advanced(angle, 180, 0.5);
        break;
}
