m_id = 0;
cost = 0;
if (global.artifact_loot)
{
    instance_destroy();
}
move_contact_solid(270, -1);
active = 0;
can_activate = 0;
value = 60;
found = 0;
cost = ceil(25 * ((2 * global.enemy_buff) - 1));
image_speed = 0.2;
yo = 0;
ff = 0;
spawns = 1;
spawn[0] = -1;
spawn[1] = -1;
alarm[1] = 1;
item_id = -1;
sprite_id = -1;
