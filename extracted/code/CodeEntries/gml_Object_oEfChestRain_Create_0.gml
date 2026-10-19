xx = oP.x;
yy = oP.y;
i = instance_nearest(xx, yy, oB);
x = i.x + 16 + (irandom_range(0, i.width_box - 2) * 16);
y = i.y;
image_speed = 0.22;
caster_play(170, global.volume, 0.9);
oHUD.alarm[0] = 10;
