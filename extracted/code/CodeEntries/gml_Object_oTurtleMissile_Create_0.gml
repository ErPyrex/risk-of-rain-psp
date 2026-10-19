image_speed = 0.25;
image_index = random(4);
image_angle = random(360);
alarm[0] = 60;
parent = -4;
speed_previous = 0;
direction_previous = 0;
if (instance_exists(oPOI))
{
    targetx = instance_nearest(x, y, oPOI).x + (random_range(-10, 10) * random_range(-10, 10));
    targety = instance_nearest(x, y, oPOI).y + (random_range(-10, 10) * random_range(-10, 10));
}
else
{
    targetx = x - 10;
    targety = y - 10;
}
range = targetx - x;
gravity = 0.1;
team = "enemy";
damage = 4;
critical = 0;
rad = random(4);
alarm[1] = 600;
var dX = targetx - x;
var dY = targety - y;
var ang = (arctan2(-dY, dX) + degtorad(90)) / 2;
if (ang != 1.5707963267948966)
{
    speed = dX / (cos(ang) * sqrt((2 * (dY + (tan(ang) * dX))) / gravity));
    direction = radtodeg(ang);
}
else
{
    instance_destroy();
    exit;
}
