angdiff = ((((argument0 - argument1) % 360) + 540) % 360) - 180;
image_angle -= (sign(angdiff) * min(argument2, abs(angdiff)));
