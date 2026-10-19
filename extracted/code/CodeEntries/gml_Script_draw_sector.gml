var centerx = argument0;
var centery = argument1;
var startangle = degtorad(argument2);
var stopangle = degtorad(argument3);
var stepangle = degtorad(argument4);
var innerradius = argument5;
var outerradius = argument6;
draw_primitive_begin(pr_trianglestrip);
for (var rad = startangle; rad < stopangle; rad += stepangle)
{
    sr = sin(rad);
    cr = cos(rad);
    draw_vertex(centerx + (innerradius * cr), centery - (innerradius * sr));
    draw_vertex(centerx + (outerradius * cr), centery - (outerradius * sr));
}
var sr = sin(stopangle);
var cr = cos(stopangle);
draw_vertex(centerx + (innerradius * cr), centery - (innerradius * sr));
draw_vertex(centerx + (outerradius * cr), centery - (outerradius * sr));
draw_primitive_end();
