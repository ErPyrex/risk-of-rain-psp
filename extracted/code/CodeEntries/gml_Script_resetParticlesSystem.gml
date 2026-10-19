for (var i = 0; i < __ParticleHandlerCount; i += 1)
{
    partHandlerDestroyParticles(i);
    ds_list_destroy(__ParticleHandler[i, 1]);
}
for (var i = 0; i < __ParticleAttractorCount; i += 1)
{
    ds_list_destroy(__ParticleAttractor[i, 4]);
}
for (var i = 0; i < __ParticleAttractorCount; i += 1)
{
    ds_list_destroy(__ParticleDeflector[i, 5]);
}
__ParticleHandlerCount = 0;
__ParticleAttractorCount = 0;
__ParticleDeflectorCount = 0;
