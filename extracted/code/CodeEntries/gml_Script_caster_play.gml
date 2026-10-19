var soundID = argument0;
var gain = argument1;
var pitch = argument2;
var audioIndex = audio_play_sound(soundID, 5, false);
audio_sound_gain(audioIndex, gain, 0);
audio_sound_pitch(audioIndex, pitch);
