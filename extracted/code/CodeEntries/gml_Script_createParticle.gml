var handler = argument[2];
var type = __ParticleHandler[handler, 0];
var partID;
if (ds_list_size(__DeadParticlesList) == 0)
{
    partID = __ParticleCount;
    __ParticleCount += 1;
}
else
{
    partID = ds_list_find_value(__DeadParticlesList, 0);
    ds_list_delete(__DeadParticlesList, 0);
}
__Particle[partID, 0] = handler;
__Particle[partID, 1] = argument[3];
__Particle[partID, 2] = __ParticleType[type, 1];
__Particle[partID, 3] = random_range(__ParticleType[type, 2], __ParticleType[type, 3]);
__Particle[partID, 4] = random_range(__ParticleType[type, 4], __ParticleType[type, 5]);
__Particle[partID, 5] = random_range(__ParticleType[type, 6], __ParticleType[type, 7]);
__Particle[partID, 6] = __ParticleType[type, 8];
__Particle[partID, 7] = random_range(__ParticleType[type, 9], __ParticleType[type, 10]);
__Particle[partID, 8] = __ParticleType[type, 11];
__Particle[partID, 9] = __Particle[partID, 7];
__Particle[partID, 10] = argument[6];
__Particle[partID, 11] = random(__ParticleType[type, 21] * 360);
__Particle[partID, 12] = argument[0];
__Particle[partID, 13] = argument[1];
__Particle[partID, 14] = max(1, irandom_range(__ParticleType[type, 14], __ParticleType[type, 15]));
__Particle[partID, 15] = 0;
__Particle[partID, 16] = random_range(__ParticleType[type, 16], __ParticleType[type, 17]);
__Particle[partID, 17] = argument[4];
__Particle[partID, 18] = argument[5];
__Particle[partID, 19] = __Particle[partID, 17];
__Particle[partID, 20] = 0;
ds_list_add(__ParticleHandler[handler, 1], partID);
