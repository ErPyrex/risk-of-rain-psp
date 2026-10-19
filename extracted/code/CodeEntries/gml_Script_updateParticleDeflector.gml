deflectorID = argument[0];
for (var i = 0; i < ds_list_size(__ParticleDeflector[deflectorID, 5]); i += 1)
{
    var handlerID = ds_list_find_value(__ParticleDeflector[deflectorID, 5], i);
    for (var k = 0; k < ds_list_size(__ParticleHandler[handlerID, 1]); k += 1)
    {
        var partID = ds_list_find_value(__ParticleHandler[handlerID, 1], k);
        if (__Particle[partID, 12] >= __ParticleDeflector[deflectorID, 0] && __Particle[partID, 12] <= __ParticleDeflector[deflectorID, 2] && __Particle[partID, 13] >= __ParticleDeflector[deflectorID, 1] && __Particle[partID, 13] <= __ParticleDeflector[deflectorID, 3])
        {
            __Particle[partID, 5] = 360 - __Particle[partID, 5];
            __Particle[partID, 3] = max(0, __Particle[partID, 3] - __ParticleDeflector[deflectorID, 4]);
            __Particle[partID, 4] = max(0, __Particle[partID, 4] - __ParticleDeflector[deflectorID, 4]);
        }
    }
}
