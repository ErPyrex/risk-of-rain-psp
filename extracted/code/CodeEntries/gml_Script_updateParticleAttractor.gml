var attractorID = argument[0];
for (var i = 0; i < ds_list_size(__ParticleAttractor[attractorID, 4]); i += 1)
{
    var handlerID = ds_list_find_value(__ParticleAttractor[attractorID, 4], i);
    for (var k = 0; k < ds_list_size(__ParticleHandler[handlerID, 1]); k += 1)
    {
        var partID = ds_list_find_value(__ParticleHandler[handlerID, 1], k);
        var distance = point_distance(__Particle[partID, 12], __Particle[partID, 13], __ParticleAttractor[attractorID, 2], __ParticleAttractor[attractorID, 3]);
        if (distance <= __ParticleAttractor[attractorID, 1])
        {
            var dir = point_direction(__Particle[partID, 12], __Particle[partID, 13], __ParticleAttractor[attractorID, 2], __ParticleAttractor[attractorID, 3]);
        }
    }
}
