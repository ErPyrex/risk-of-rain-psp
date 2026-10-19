var yix = -1;
switch (argument0)
{
    case global.jump_key:
        yix = 0;
        break;
    case global.v_key:
        yix = 1;
        break;
    case global.z_key:
        yix = 2;
        break;
    case global.yes_key:
        yix = 3;
        break;
    case global.x_key:
        yix = 4;
        break;
    case global.c_key:
        yix = 5;
        break;
    case global.use_key:
        yix = 6;
        break;
    case 27:
        yix = 7;
        break;
    case global.left_key:
        yix = 8;
        break;
    case global.right_key:
        yix = 9;
        break;
    case global.up_key:
        yix = 10;
        break;
    case global.down_key:
        yix = 11;
        break;
}
if (yix != -1 && global.yoyocontrol[yix] == 1)
{
    return 1;
}
return 0;
