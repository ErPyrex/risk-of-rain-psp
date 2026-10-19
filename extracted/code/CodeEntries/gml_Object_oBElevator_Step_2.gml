width_box *= -1;
yy += fall_speed;
if (abs(yy) == 1)
{
    y += yy;
    yy = 0;
}
can_activate = 0;
if (point_distance(oP.x, oP.y, x, y) < 30)
{
    can_activate = 1;
}
if (keyboard_check_pressed(global.yes_key) == 1 && active == 0 && can_activate == 1)
{
    y += sign(ddirection);
    global.director.points += 200 * global.enemy_buff;
    global.director.bonus_rate += 2;
    oHUD.alarm[0] = 10;
    active = 1;
    fall_speed = 1 * sign(ddirection);
    ddirection *= -1;
}
if (active == 1 && (place_meeting(x, y, pBlock) == 1 || oP.dead == 1))
{
    global.director.bonus_rate -= 2;
    oHUD.alarm[0] = 10;
    active = 0;
    fall_speed = 0;
}
