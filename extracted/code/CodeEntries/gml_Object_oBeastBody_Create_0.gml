event_inherited();
alarm[1] = 1;
hp = 0;
dot_immune = 50;
team = "enemy";
neck_number = 4;
invincible = 0;
tail_number = 10;
ff = 0;
intended_speed = 4;
chase = 0;
target_x = -1;
target_y = -1;
target_angle = 0;
state = -1;
alarm[0] = 15;
ramp_up = 0;
neck[0] = instance_create(x + 37, y, oBeastHead);
neck[0].parent = id;
neck[0].offset = 37;
neck[0].head = 0;
neck[0].true_parent = id;
for (i = 0; i <= neck_number; i += 1)
{
    neck_number -= 1;
    with (neck[i])
    {
        head = 0;
        other.neck[other.i + 1] = instance_create(x + 28, y, oBeastHead);
        other.neck[other.i + 1].parent = id;
        other.neck[other.i + 1].offset = 28;
        other.neck[other.i + 1].true_parent = other.id;
        if (other.neck_number == 1)
        {
            other.neck[other.i + 1].head = 1;
            other.neck[other.i + 1].image_index = 0;
        }
    }
}
for (i = 0; i < 3; i += 1)
{
    neck[i].son = neck[i + 1];
}
leg[0] = instance_create(x - 15, y, oBeastLeg);
leg[0].parent = id;
leg[0].offset = -15;
leg[0].true_parent = id;
tail[0] = instance_create(x - 15 - 55, y, oBeastTail);
tail[0].parent = leg[0];
tail[0].offset = -55;
tail[0].true_parent = id;
for (i = 0; i <= tail_number; i += 1)
{
    tail_number -= 1;
    with (tail[i])
    {
        other.tail[other.i + 1] = instance_create(x - 25, y, oBeastTail);
        other.tail[other.i + 1].parent = id;
        other.tail[other.i + 1].offset = -25;
        other.tail[other.i + 1].image_yscale = 1 - (other.i / 10);
        other.tail[other.i + 1].true_parent = other.id;
        if (other.tail_number == 1)
        {
            other.tail[other.i + 1].image_index = 0;
        }
    }
}
