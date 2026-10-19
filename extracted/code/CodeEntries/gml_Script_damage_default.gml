argument0.critical = (irandom(100) + 1) <= (critical_chance + critical_chance_bonus);
argument0.damage_fake = ceil(damage * random_range(1, 0.6) * (argument0.critical + 1) * argument1);
argument0.damage = ceil(damage * 0.8 * (argument0.critical + 1) * argument1);
