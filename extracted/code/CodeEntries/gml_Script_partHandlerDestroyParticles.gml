for (var i = 0; i < ds_list_size(__ParticleHandler[argument[0], 1]); i += 1)
{
    ds_list_add(__DeadParticlesList, ds_list_find_value(__ParticleHandler[argument[0], 1], i));
}
ds_list_clear(__ParticleHandler[argument[0], 1]);
