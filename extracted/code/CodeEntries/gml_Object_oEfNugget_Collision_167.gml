caster_play(158, global.volume, 2);
other.hp = min(other.hp + value, other.maxhp);
image_index = 0;
instance_destroy();
i = instance_create(x, y, oEfDamage);
i.critical = 0;
i.damage = value;
i.team = "heal";
