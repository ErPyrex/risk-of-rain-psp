damage = 5;
critical = 0;
team = "player";
bounce = 3;
image_alpha = 2;
blend = 12892302;
alarm[0] = 1;
enemy_type = -1;
target[0, 1] = x;
target[0, 2] = y;
target[0, 0] = -1;
for (i = 1; i <= bounce; i += 1)
{
    target[i, 0] = -1;
    target[i, 2] = (target[i - 1, 2] - 20) + random(40);
    target[i, 1] = (target[i - 1, 1] - 20) + random(40);
}
