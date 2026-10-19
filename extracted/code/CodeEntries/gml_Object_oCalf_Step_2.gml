x = parent.x + lengthdir_x(parent.thigh_length, parent.angle);
y = parent.y + lengthdir_y(parent.thigh_length, parent.angle);
switch (sign(cos(degtorad(parent.ff + 90))))
{
    case -1:
        angle = turn_towards_advanced(angle, 340, 0.5);
        break;
    case 1:
        angle = turn_towards_advanced(angle, parent.angle, 0.5);
        break;
}
