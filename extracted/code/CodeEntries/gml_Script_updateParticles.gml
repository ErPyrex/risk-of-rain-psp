var listAliveID = __ParticleHandler[argument[0], 1];
var type = __ParticleHandler[argument[0], 0];
var pathID = __ParticleType[type, 24];
for (var i = 0; i < ds_list_size(listAliveID); i += 1)
{
    var partID = ds_list_find_value(listAliveID, i);
    var normalizedAge = __Particle[partID, 15] / __Particle[partID, 14];
    if (normalizedAge == 1)
    {
        ds_list_delete(listAliveID, i);
        ds_list_add(__DeadParticlesList, partID);
        i -= 1;
    }
    else
    {
        var spd = __Particle[partID, 3] + (normalizedAge * (__Particle[partID, 4] - __Particle[partID, 3]));
        if (pathID != -4)
        {
            var pathLength = path_get_length(pathID);
            var normalizedLength;
            if (path_get_closed(pathID) == 1)
            {
                normalizedLength = (__Particle[partID, 20] / pathLength) % 1;
            }
            else
            {
                normalizedLength = min(0.95, __Particle[partID, 20] / pathLength);
            }
            __Particle[partID, 20] += spd;
            __Particle[partID, 5] = point_direction(path_get_x(pathID, normalizedLength), path_get_y(pathID, normalizedLength), path_get_x(pathID, normalizedLength + 0.05), path_get_y(pathID, normalizedLength + 0.05));
        }
        else
        {
            __Particle[partID, 5] += __Particle[partID, 6];
        }
        __Particle[partID, 12] += lengthdir_x(spd, __Particle[partID, 5]);
        __Particle[partID, 13] += lengthdir_y(spd, __Particle[partID, 5]);
        __Particle[partID, 9] = __Particle[partID, 7] + (normalizedAge * (__Particle[partID, 8] - __Particle[partID, 7]));
        __Particle[partID, 19] = merge_color(__Particle[partID, 17], __Particle[partID, 18], normalizedAge);
        __Particle[partID, 15] += 1;
    }
}
