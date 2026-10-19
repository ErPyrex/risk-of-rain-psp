__ParticleHandler[argument[2], 2] += argument[3] / room_speed;
while (__ParticleHandler[argument[2], 2] >= 1)
{
    createParticle(argument[0], argument[1], argument[2]);
    __ParticleHandler[argument[2], 2] += -1;
}
