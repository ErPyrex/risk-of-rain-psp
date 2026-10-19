var type = __ParticleHandler[argument[0], 0];
var listID = __ParticleHandler[argument[0], 1];
var spriteIndex = __ParticleType[type, 0];
for (var i = 0; i < ds_list_size(listID); i += 1)
{
    partID = ds_list_find_value(listID, i);
    if (!__ParticleType[type, 25])
    {
        draw_sprite_ext(spriteIndex, __Particle[partID, 1], __Particle[partID, 12], __Particle[partID, 13], 1, 1, __Particle[partID, 11], __Particle[partID, 19], __Particle[partID, 9]);
    }
    else
    {
        if (!__Particle[partID, 10])
        {
            draw_set_font(global.fntDamage);
        }
        else
        {
            draw_set_font(global.fntCrit);
        }
        draw_text_ext_colour(__Particle[partID, 12], __Particle[partID, 13], __Particle[partID, 1], 10, -1, __Particle[partID, 19], __Particle[partID, 19], __Particle[partID, 19], __Particle[partID, 19], __Particle[partID, 9]);
    }
}
