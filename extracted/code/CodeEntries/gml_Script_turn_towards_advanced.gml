angdiff = ((((argument0 - argument1) % 360) + 540) % 360) - 180;
return argument0 - ((angdiff / 10) * argument2);
