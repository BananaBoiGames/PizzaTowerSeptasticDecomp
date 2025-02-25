function scr_sound()
{
    var snd;
    
    snd = argument[irandom(argument_count - 1)];
    global.music = audio_play_sound(snd, 10, true);
    audio_sound_gain(global.music, 0.6 * global.option_music_volume, 0);
}

function set_master_gain(argument0)
{
    var num, i, info;
    
    num = audio_get_listener_count();
    
    for (i = 0; i < num; i++)
    {
        info = audio_get_listener_info(i);
        audio_set_master_gain(ds_map_find_value(info, "index"), argument0);
        ds_map_destroy(info);
    }
}
