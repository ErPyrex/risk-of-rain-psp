if (!global.pause)
{
    audio_resume_sound(wWormBurning);
    audio_pause_sound(global.music_id);
    global.pause = 1;
    if (oInit.coop != 2)
    {
        pause_sprite = sprite_create_from_surface(application_surface, 0, 0, view_wview[0], view_hview[0], false, false, 0, 0);
        instance_deactivate_all(true);
        instance_activate_object(oInit);
        instance_activate_object(objYoYoController);
    }
    if (room == rStart)
    {
        list_active = list_alt;
    }
    else
    {
        list_active = list_default;
    }
}
else if (global.pause)
{
    list_active = list_default;
    choice = 0;
    audio_resume_sound(global.music_id);
    global.pause = 0;
    instance_activate_all();
    if (sprite_exists(pause_sprite))
    {
        sprite_delete(pause_sprite);
    }
}
