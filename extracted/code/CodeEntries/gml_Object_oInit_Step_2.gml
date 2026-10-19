global.menu_delay = max(0, global.menu_delay - 1);
if (last_mouse_x != device_mouse_raw_x(0) || last_mouse_y != device_mouse_raw_y(0))
{
    last_mouse_x = device_mouse_raw_x(0);
    last_mouse_y = device_mouse_raw_y(0);
    last_mouse_timer = 0;
    moved_mouse = 1;
}
else
{
    moved_mouse = 0;
    last_mouse_timer += 1;
}
if (global.music_name >= 0 && audio_is_playing(global.music_name) == 0 && !global.pause && global.time_stop == 0)
{
    music_fade = min(1, music_fade + 0.01);
    if (music_fade == 1)
    {
        if (global.music_id != -1)
        {
            audio_stop_sound(global.music_id);
        }
        global.music_id = audio_play_sound(global.music_name, 20, true);
    }
}
else
{
    music_fade = max(0, music_fade - 0.1);
}
if (global.music_id != -1)
{
    audio_sound_gain(global.music_id, max(0, global.music_volume - music_fade), 0);
}
if (instance_number(pDrone) >= 4)
{
    achievement_progress(4, 1);
}
move_view();
draw_bg();
