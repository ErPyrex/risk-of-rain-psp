image_angle += rate;
x += (0.3 * power(size, 2));
y -= (0.3 * power(size, 2));
part_type_size(global.pDiagFire, 0.6 * size, 1 * size, 0, 0);
part_particles_create(global.middle, x, y, global.pDiagFire, 1);
