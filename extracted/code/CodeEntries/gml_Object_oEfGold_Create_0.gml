f = 0;
image_speed = 0;
yo = 0;
yy = 0;
used = 0;
dead = 0;
image_speed = 0.2;
image_index = random(4);
direction = random(360);
vsspeed = lengthdir_x(random_range(1, 3), direction);
hsspeed = lengthdir_y(random_range(1, 3), direction);
sspeed = 0;
yo = -2 + random(4);
value = 1;
target = -5;
p_gravity = 0.1;
if (global.graphics > 1)
{
    visible = true;
}
